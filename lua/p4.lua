-- Create a command 'P4a' in Neovim
vim.api.nvim_create_user_command('P4a', function()
    -- Get the current buffer number
    local buf = vim.api.nvim_get_current_buf()

    -- Get the current file path
    local current_file = vim.api.nvim_buf_get_name(buf)
    -- print("Current file path: " .. (current_file ~= "" and current_file or "No file associated"))  -- Debug print

    if current_file == "" then
        vim.notify("No file associated with the current buffer", vim.log.levels.ERROR)
        return
    end

    local p4_exe = "p4"

	local os_info = vim.loop.os_uname()
    local file_path = current_file
	if os_info.sysname == "Windows_NT" then
        p4_exe = "p4.exe"
        -- Convert the WSL file path to a Windows file path
        local cmd_convert_path = 'wslpath -w "' .. current_file .. '"'
        local windows_file_path = vim.fn.systemlist(cmd_convert_path)[1]
        -- deobfuscate windows file path
        windows_file_path = windows_file_path:gsub("\\", "\\\\")
        --print("Windows file path: " .. windows_file_path)  -- Debug print
        file_path = windows_file_path
    end

    -- p4 annotate command
    -- -u -- show user
    -- -c -- show cl number
    -- -I -- show integration history(useful for multiple branches)
    local cmd = p4_exe .. ' annotate -u -I -c ' .. file_path

    vim.notify(cmd)
    --print("Command: " .. cmd)  -- Debug print

    -- Run the command and capture the output
    local output = vim.fn.systemlist(cmd)

    -- Create a new vertical buffer and split window
    vim.cmd('vnew')

    -- Get the buffer of the new window
    local buf = vim.api.nvim_get_current_buf()

    -- Set the buffer content to the command output
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)

    -- Set the buffer to be temporary and non-modifiable
    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].bufhidden = 'wipe'
    vim.bo[buf].modifiable = false
    vim.bo[buf].readonly = true
    vim.bo[buf].swapfile = false
end, {})
