local M = {}

function M.check()
	vim.health.start("MyNeovim")

	vim.health.ok(("Neovim %s"):format(vim.version()))

	local executables = { "git", "make", "gcc", "g++" }
	for _, exe in ipairs(executables) do
		if vim.fn.executable(exe) == 1 then
			vim.health.ok(("`%s` found"):format(exe))
		else
			vim.health.warn(("`%s` not found in PATH. Some features may not work."):format(exe))
		end
	end
end

return M
