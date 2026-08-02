return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	flag = "dashboard",
	config = function()
		if require("dist.features").features.dashboard then
			require("core.dashboard").setup()
		end
	end,
}
