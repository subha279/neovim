-- Load dist module first
require("dist").setup()

-- Load core modules in order
require("core.globals")
require("core.options")
require("core.keymaps")
require("core.ui").setup()
require("core.diagnostics").setup()
require("core.health").check()
