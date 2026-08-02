local M = {}

function M.prompt(prompt, choices, callback)
	vim.ui.select(choices, { prompt = prompt }, function(choice)
		callback(choice)
	end)
end

return M
