local function read_env_file(path)
  if vim.fn.filereadable(path) == 0 then
    return {}
  end

  local result = {}
  for _, line in ipairs(vim.fn.readfile(path)) do
    local trimmed = vim.trim(line)
    if trimmed ~= "" and not vim.startswith(trimmed, "#") then
      local key, value = trimmed:match("^([%w_]+)%s*=%s*(.*)$")
      if key then
        value = value:gsub("^['\"]", ""):gsub("['\"]$", "")
        result[key] = value
      end
    end
  end

  return result
end

local function load_project_env()
  local cwd = vim.fn.getcwd()
  local env = vim.fn.environ()

  local from_dotenv = read_env_file(cwd .. "/.env")
  local from_dotenv_local = read_env_file(cwd .. "/.env.local")

  return vim.tbl_extend("force", env, from_dotenv, from_dotenv_local)
end

return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      dap.configurations.go = dap.configurations.go or {}

      table.insert(dap.configurations.go, {
        type = "go",
        name = "Launch: stanko-backend (cmd/backend)",
        request = "launch",
        mode = "debug",
        program = "${workspaceFolder}/cmd/backend",
        cwd = "${workspaceFolder}",
        env = function()
          return load_project_env()
        end,
      })

      table.insert(dap.configurations.go, {
        type = "go",
        name = "Attach: pick process (local)",
        mode = "local",
        request = "attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      })

      dap.adapters.go_remote = {
        type = "server",
        host = "127.0.0.1",
        port = 2347,
      }

      table.insert(dap.configurations.go, {
        type = "go_remote",
        name = "Launch via DAP server: stanko-backend :2347",
        request = "launch",
        mode = "debug",
        program = "${workspaceFolder}/cmd/backend",
        cwd = "${workspaceFolder}",
        env = function()
          return load_project_env()
        end,
      })
    end,
  },
}
