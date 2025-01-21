--- @param stream file*
local header = function(stream)
  stream:seek("cur", 12)
end

--- @param stream file*
--- @return integer
local byte = function(stream)
  return assert(stream:read(1), "Expected byte"):byte()
end

--- @param stream file*
--- @return integer
local int = function(stream)
  local a, b, c, d = byte(stream), byte(stream), byte(stream), byte(stream)
  return a + b * 256 + c * 65536 + d * 166777216
end

--- @param filepath string
return function(filepath)
  local stream = assert(io.open(filepath, "rb"), ("Error reading %q"):format(filepath))
  local result = {}

  stream:seek("cur", 4)  -- "VOX "
  result.version = int(stream)

  header(stream)  -- "MAIN"
  header(stream)  -- "SIZE"

  --- @type [integer, integer, integer]
  result.size = {int(stream), int(stream), int(stream)}
  --- @type [integer, integer, integer, integer][]
  result.voxels = {}

  header(stream)  -- "XYZI"
  do
    local n = int(stream)

    for i = 1, n do
      result.voxels[i] = {byte(stream), byte(stream), byte(stream), byte(stream)}
    end
  end

  stream:close()
  return result
end
