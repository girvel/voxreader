# voxreader

Lua library for reading MagicaVoxel's .vox files. Tested on `0.99.7.1`. Reads version, size, voxels and palette.

## Usage

```lua
local voxreader = require("voxreader")
local data = voxreader("your_file.vox")
print(#data.voxels)
```

## Installation

Copy the content of init.lua or `git clone` the repository.
