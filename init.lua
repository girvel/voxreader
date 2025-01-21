--- @param stream file*
local read_header = function(stream)
  print(stream:read(4))
  --assert(stream:read(4) ~= "PACK")
  return {
    content_size = stream:read(4):byte(),
    children_size = stream:read(4):byte(),
  }
end

--- @param filepath string
return function(filepath)
  local stream = assert(io.open(filepath, "rb"), ("Error reading %q"):format(filepath))
  local result = {}

  stream:seek("cur", 4)  -- "VOX "
  result.version = string.byte(stream:read(4))

  read_header(stream)  -- "MAIN"
  result.models = {{}}

  read_header(stream)  -- "SIZE"
  result.models[1].size = {stream:read(4):byte(), stream:read(4):byte(), stream:read(4):byte()}
  --local xyzi = read_header(stream)  -- "XYZI"

  stream:close()
  return result
end
