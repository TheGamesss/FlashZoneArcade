import { cpSync, existsSync, mkdirSync, rmSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const rootDir = dirname(dirname(fileURLToPath(import.meta.url)));
const sourceDir = join(rootDir, "node_modules", "@ruffle-rs", "ruffle");
const targetDir = join(rootDir, "vendor", "ruffle");

if (!existsSync(sourceDir)) {
  throw new Error(
    "Ruffle is not installed yet. Run `npm install` before `npm run build`."
  );
}

rmSync(targetDir, { force: true, recursive: true });
mkdirSync(targetDir, { recursive: true });
cpSync(sourceDir, targetDir, { force: true, recursive: true });
