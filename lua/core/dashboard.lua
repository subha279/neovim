local M = {}

local LOGO = {
	[[███╗   ███╗ ██╗   ██╗ ███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
	[[████╗ ████║ ╚██╗ ██╔╝ ████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
	[[██╔████╔██║  ╚████╔╝  ██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
	[[██║╚██╔╝██║   ╚═══╝   ██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
	[[██║ ╚═╝ ██║   ██╗     ██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
	[[╚═╝     ╚═╝   ╚═╝     ╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
}

local LOGO_HL = { "MyNeovimLogo1", "MyNeovimLogo2", "MyNeovimLogo3", "MyNeovimLogo4", "MyNeovimLogo5", "MyNeovimLogo6" }

function M.setup()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	-- Per-line highlight groups for the logo (onedark-ish gradient)
	local colors = { "#61afef", "#56b6c2", "#c678dd", "#d19a66", "#e5c07b", "#98c65d" }
	for i = 1, 6 do
		vim.api.nvim_set_hl(0, LOGO_HL[i], { fg = colors[i] })
	end

	-- Logo header
	dashboard.section.header.val = LOGO
	dashboard.section.header.opts.hl = {
		{ { LOGO_HL[1], 0, -1 } },
		{ { LOGO_HL[2], 0, -1 } },
		{ { LOGO_HL[3], 0, -1 } },
		{ { LOGO_HL[4], 0, -1 } },
		{ { LOGO_HL[5], 0, -1 } },
		{ { LOGO_HL[6], 0, -1 } },
	}

	-- Buttons
	dashboard.section.buttons.val = {
		dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
		dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
		dashboard.button("q", "  Quit", ":qa<CR>"),
	}

	-- Info section: version, plugins, startup time
	local stats = require("lazy").stats()
	local version = vim.version()
	local startuptime = stats.startuptime
	if startuptime <= 0 and vim.g.startuptime_ref then
		startuptime = (vim.uv.hrtime() - vim.g.startuptime_ref) / 1e6
	end
	local info = {
		type = "text",
		val = {
			"Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch .. "  ·  " .. stats.count .. " plugins",
			"⚡ Startup in " .. string.format("%.1f", startuptime) .. " ms",
		},
		opts = {
			position = "center",
			hl = "Comment",
		},
	}

	-- Footer with fortune (fallback if not installed)
	if vim.fn.executable("fortune") == 1 then
		local handle = io.popen("fortune")
		local fortune = handle:read("*a")
		handle:close()
		dashboard.section.footer.val = fortune
		dashboard.section.footer.opts.hl = "Comment"
	else
		dashboard.section.footer.val = "Have a productive day!"
		dashboard.section.footer.opts.hl = "Comment"
	end

	-- Layout
	dashboard.config.layout = {
		{ type = "padding", val = 3 },
		dashboard.section.header,
		{ type = "padding", val = 2 },
		dashboard.section.buttons,
		{ type = "padding", val = 2 },
		info,
		{ type = "padding", val = 3 },
		dashboard.section.footer,
	}

	-- Apply the configuration
	alpha.setup(dashboard.config)
end

return M
