const fs = require("fs");

const file1 = "./lab4/file1.txt";
const file2 = "./lab4/file2.txt";

const data1 = fs.readFileSync(file1, "utf8");
const data2 = fs.readFileSync(file2, "utf8");

const mergedData = data1 + "\n" + data2;

fs.writeFileSync("./lab4/merged.txt", mergedData);

console.log("contents of file1 and file2 merged" );

