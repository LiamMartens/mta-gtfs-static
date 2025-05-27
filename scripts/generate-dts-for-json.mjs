import fs from "node:fs";
import JsonToTS from "json-to-ts";

const jsonFile = process.argv[2];
const outFile = process.argv[3];

if (!jsonFile)
  throw new Error("Please provide a JSON file path as an argument.");
if (!outFile)
  throw new Error("Please provide an output file path as an argument.");
if (!fs.existsSync(jsonFile)) throw new Error(`File not found: ${jsonFile}`);

const jsonContent = JSON.parse(fs.readFileSync(jsonFile, "utf-8"));
fs.writeFileSync(
  outFile,
  [
    ...JsonToTS(jsonContent.slice(0, 10)),
    `declare const data: RootObject[];`,
    `export default data;`,
  ].join("\n\n")
);
