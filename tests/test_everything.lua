local voxreader = require("init")
local inspect = require("tests.resources.inspect")

it("Parses the example file", function()
  local path = "tests/resources/tesseract.vox"
  local f = assert(io.open(path, "rb"))
  local file_bytes = f:read("*a")
  f:close()

  print("\n---------- CONTENT ----------")
  print(file_bytes:sub(1, 100))

  local voxel_data = voxreader(path)

  print("\n---------- RESULT ----------")
  print(inspect(voxel_data))
end)
