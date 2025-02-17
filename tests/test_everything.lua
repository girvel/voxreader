local voxreader = require("init")

it("Parses the example file", function()
  local path = "tests/resources/tesseract.vox"
  local voxel_data = voxreader(path)

  assert.are_equal(voxel_data.version, 200)
  assert.are_same(voxel_data.size, {40, 40, 40})
  assert.are_equal(#voxel_data.voxels, 2790)
  assert.are_equal(#voxel_data.palette, 256)
end)
