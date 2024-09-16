local function tabnine_build_path()
  -- Replace vim.uv with vim.loop if using NVIM 0.9.0 or below
  if vim.loop.os_uname().sysname == "Windows_NT" then
    return "pwsh.exe -file .\\dl_binaries.ps1"
  else
    return "./dl_binaries.sh"
  end
end

local tabnine_enterprise_host = "https://tabnine-poc.hwinf-scm-aws.nvidia.com"
return {
    "/codota/tabnine-nvim",
    config = function()
    require('tabnine').setup({
      disable_auto_comment=true,
      accept_keymap="<Tab>",
      dismiss_keymap = "<C-]>",
      debounce_ms = 800,
      suggestion_color = {gui = "#808080", cterm = 244},
      codelens_color = { gui = "#808080", cterm = 244 },
      codelens_enabled = true,
      exclude_filetypes = {"TelescopePrompt", "NvimTree"},
      log_file_path = nil, -- absolute path to Tabnine log file,
      tabnine_enterprise_host = tabnine_enterprise_host
    })
    end,
    build = tabnine_build_path(),
    lazy = false,
}