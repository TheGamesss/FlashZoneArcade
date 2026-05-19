import { copyFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const rootDir = dirname(dirname(fileURLToPath(import.meta.url)));

copyFileSync(
  join(rootDir, "my-custom-shell.html"),
  join(rootDir, "index.html")
);
