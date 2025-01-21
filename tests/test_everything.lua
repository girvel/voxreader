local voxreader = require("init")

it("Parses the example file", function()
  local f = assert(io.open("tests/resources/tesseract.vox", "rb"))
  local file_bytes = f:read("*a")
  print(file_bytes)
end)
