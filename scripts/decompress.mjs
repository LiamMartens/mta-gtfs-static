import fs from "fs-extra";
import zip from "cross-zip";

if (fs.existsSync("./gtfs_js.zip") && fs.existsSync("./gtfs_json.zip")) {
  zip.unzipSync("./gtfs_js.zip", "./gtfs_js");
  zip.unzipSync("./gtfs_json.zip", "./gtfs_json");
}
