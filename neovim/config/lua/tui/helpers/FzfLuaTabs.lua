function FzfLuaTabs()
  local fzf = require("fzf-lua")
  local tabs = {}

  -- Iterate over all tab pages and get their details
  for i, tab in ipairs(vim.api.nvim_list_tabpages()) do 
    local windows = vim.api.nvim_tabpage_list_wins(tab)
    local bufnr = vim.api.nvim_win_get_buf(windows[1]) -- Get the buffer number of the first window in the tab
    local bufname = vim.api.nvim_buf_get_name(bufnr) -- Get the name of the buffer

    -- Format the entry for fzf-lua
    table.insert(tabs, string.format("Tab %d: %s", i, bufname))
  end

  -- Use fzf-lua to select a tab
  fzf.fzf_exec(tabs, {
    prompt = "Select Tab > ",
    -- Custom action to switch to the selected tab
    actions = {
      ["enter"] = function(selected)
        if not selected or #selected == 0 then return end

        -- Extract the tab number from the selected string (e.g., "Tab 1: ...")
        local tab_index = tonumber(string.match(selected[1], "Tab (%d+):"))
        if tab_index then
          -- Switch to the selected tab page
          vim.api.nvim_set_current_tabpage(vim.api.nvim_list_tabpages()[tab_index])
        end
      end,
    },
    winopts = {
      height = 0.5,
      width = 0.8,
    },
  })
end

-- Example keymap (normal mode, leader + t)
vim.keymap.set("n", "<Leader>t", FzfLuaTabs, { silent = true, desc = "Fzf-lua select tab page" })
