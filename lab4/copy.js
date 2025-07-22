const fs = require("fs");

const sourceFile = "./lab4/source.txt";
const destinationFile = "./lab4/destination.txt";

if (fs.existsSync(sourceFile)) {
  const data = fs.readFileSync(sourceFile, "utf8");

  fs.writeFileSync(destinationFile, data);

  console.log("Content Copied");
} else {
  console.log("Source file does not exist.");
}
