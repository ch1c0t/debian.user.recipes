-- Define the core function to dump messages to a file
save_messages = (opts) ->
  -- Use the provided argument as filename, or default to 'messages.txt'
  filename = if opts.args != "" then opts.args else "messages.txt"

  -- Capture the output of the :messages command
  messages_output = vim.api.nvim_exec2 "messages", output: true

  -- Write to file
  file = io.open filename, "w"
  if file
    file\write messages_output.output
    file\close!
    print "Messages saved to #{filename}"
  else
    print "Error: Could not open file #{filename} for writing."

-- 1. Create the User Command (:SaveMessages or :SaveMessages custom.txt)
vim.api.nvim_create_user_command "SaveMessages", save_messages, nargs: "?"

-- 2. Create a Keymap (e.g., <leader>sm to save to default messages.txt)
vim.keymap.set "n", "<leader>sm", (-> save_messages{ args: "" }), desc: "Save nvim messages to file"
