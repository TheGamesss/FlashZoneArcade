import { createReadStream, existsSync, statSync } from "node:fs";
import http from "node:http";
import { extname, join, normalize } from "node:path";

const host = process.env.HOST ?? "127.0.0.1";
const port = Number(process.env.PORT ?? "4173");
const rootDir = process.cwd();

const mimeTypes = new Map([
  [".css", "text/css; charset=utf-8"],
  [".html", "text/html; charset=utf-8"],
  [".js", "text/javascript; charset=utf-8"],
  [".json", "application/json; charset=utf-8"],
  [".map", "application/json; charset=utf-8"],
  [".png", "image/png"],
  [".svg", "image/svg+xml"],
  [".swf", "application/x-shockwave-flash"],
  [".txt", "text/plain; charset=utf-8"],
  [".wasm", "application/wasm"],
  [".xml", "application/xml; charset=utf-8"],
  [".zip", "application/zip"]
]);

function resolvePath(urlPath) {
  const safePath = normalize(decodeURIComponent(urlPath)).replace(/^(\.\.[/\\])+/, "");
  const basePath = safePath === "/" ? "my-custom-shell.html" : safePath.replace(/^[/\\]+/, "");
  const absolutePath = join(rootDir, basePath);

  if (existsSync(absolutePath) && statSync(absolutePath).isFile()) {
    return absolutePath;
  }

  if (existsSync(absolutePath) && statSync(absolutePath).isDirectory()) {
    const nestedIndex = join(absolutePath, "index.html");
    if (existsSync(nestedIndex)) {
      return nestedIndex;
    }
  }

  return null;
}

const server = http.createServer((request, response) => {
  const requestUrl = new URL(request.url ?? "/", `http://${request.headers.host ?? host}`);
  const filePath = resolvePath(requestUrl.pathname);

  if (!filePath) {
    response.writeHead(404, { "Content-Type": "text/plain; charset=utf-8" });
    response.end("Not found");
    return;
  }

  const extension = extname(filePath).toLowerCase();
  const headers = {
    "Cache-Control": extension === ".wasm" ? "public, max-age=31536000, immutable" : "no-cache",
    "Content-Type": mimeTypes.get(extension) ?? "application/octet-stream"
  };

  response.writeHead(200, headers);
  createReadStream(filePath).pipe(response);
});

server.listen(port, host, () => {
  console.log(`Static site available at http://${host}:${port}`);
});
