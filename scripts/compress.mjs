import fs from "fs-extra";
import zip from "cross-zip";

zip.zipSync("./gtfs_js", "./gtfs_js.zip");
zip.zipSync("./gtfs_json", "./gtfs_json.zip");

fs.rmdirSync("./gtfs_js", {
  recursive: true,
});
fs.rmdirSync("./gtfs_json", {
  recursive: true,
});
