return {
	"mfussenegger/nvim-dap",
	keys = {
		{ "<Leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
		{ "<Leader>dc", function() require("dap").continue() end, desc = "Start debugger" },
		{ "<Leader>di", function() require("dap").step_into() end, desc = "Step into" },
		{ "<Leader>do", function() require("dap").step_over() end, desc = "Step over" },
		{ "<Leader>dO", function() require("dap").step_out() end, desc = "Step out" },
		{ "<Leader>dr", function() require("dap").repl.open() end, desc = "Open REPL" },
	},
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
		{
			"mxsdev/nvim-dap-vscode-js",
			config = function()
				local js = require("dap-vscode-js")
				js.setup({
					debugger_cmd = { "js-debug-adapter" },
					adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal" },
				})
				local dap = require("dap")
				for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
					dap.configurations[language] = {
						{
							type = "pwa-node",
							request = "launch",
							name = "Launch file",
							program = "${file}",
							cwd = "${workspaceFolder}",
						},
						{
							type = "pwa-node",
							request = "attach",
							name = "Attach to process",
							processId = require("dap.utils").pick_process,
							cwd = "${workspaceFolder}",
						},
					}
				end
			end,
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		require("mason-nvim-dap").setup({
			ensure_installed = { "python", "codelldb", "js" },
			automatic_installation = true,
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
				python = function(config)
					local py = vim.fn.exepath("python3")
					if py == "" then
						py = vim.fn.exepath("python")
					end
					config.adapters = {
						type = "executable",
						command = py,
						args = { "-m", "debugpy.adapter" },
					}
					local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
					config.configurations = {
						{
							type = "python",
							request = "launch",
							name = "Launch file",
							program = "${file}",
							pythonPath = venv and venv .. "/bin/python" or py,
						},
						{
							type = "python",
							request = "attach",
							name = "Attach to process",
							connect = {
								host = "127.0.0.1",
								port = 5678,
							},
						},
					}
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})
	end,
}
