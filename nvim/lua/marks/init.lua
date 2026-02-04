
local M = {}

-- Namespace for virtual text
local ns = vim.api.nvim_create_namespace("marks")

-- Default config
M.config = {
  symbol = "🔖",
  highlight = "Todo",
  persist_file = vim.fn.stdpath("data") .. "/marks.json",
}

-- Table to store marks
M.marks = {}

------------------------------------------------------------
-- Setup function for user configuration
------------------------------------------------------------
function M.setup(opts)
  print("Setting up marks plugin")
  M.config = vim.tbl_extend("force", M.config, opts or {})
  M.load_marks()
end

------------------------------------------------------------
-- Add a mark at current line
------------------------------------------------------------
function M.add_mark()
  local buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)
  local line = vim.api.nvim_win_get_cursor(0)[1]

  -- Check if mark already exists
  for _, mark in ipairs(M.marks) do
    if mark.filename == file and mark.lnum == line then
      vim.notify("Mark already exists at this line", vim.log.levels.WARN)
      return
    end
  end

  -- Prompt for note
  vim.ui.input({ prompt = "Enter note for mark: " }, function(note)
    if note then
      -- Save mark
      local mark_text = M.config.symbol .. " " .. (note ~= "" and note or "Mark")
      table.insert(M.marks, { filename = file, lnum = line, text = mark_text, note = note })

      -- Add virtual text
      vim.api.nvim_buf_set_extmark(buf, ns, line - 1, 0, {
        virt_text = { { M.config.symbol, M.config.highlight } },
        virt_text_pos = "eol",
      })

      M.save_marks()
      vim.notify("Mark added", vim.log.levels.INFO)
    end
  end)
end

------------------------------------------------------------
-- Remove mark from current line
------------------------------------------------------------
function M.remove_mark()
  local buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)
  local line = vim.api.nvim_win_get_cursor(0)[1]

  for i, mark in ipairs(M.marks) do
    if mark.filename == file and mark.lnum == line then
      table.remove(M.marks, i)
      vim.api.nvim_buf_clear_namespace(buf, ns, line - 1, line)
      break
    end
  end

  M.save_marks()
end

------------------------------------------------------------
-- Show note for mark at current line
------------------------------------------------------------
function M.show_note()
  local buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)
  local line = vim.api.nvim_win_get_cursor(0)[1]

  for _, mark in ipairs(M.marks) do
    if mark.filename == file and mark.lnum == line then
      local note = mark.note or ""
      vim.ui.input({ prompt = "Mark note: ", default = note }, function(new_note)
        if new_note then
          mark.note = new_note
          mark.text = M.config.symbol .. " " .. (new_note ~= "" and new_note or "Mark")
          M.save_marks()
          vim.notify("Note updated", vim.log.levels.INFO)
        end
      end)
      return
    end
  end

  vim.notify("No mark at current line", vim.log.levels.WARN)
end

------------------------------------------------------------
-- Show marks in quickfix
------------------------------------------------------------
function M.show_marks()
  vim.fn.setqflist(M.marks)
  vim.cmd("copen")
end

------------------------------------------------------------
-- Persistence: Save and Load
------------------------------------------------------------
function M.save_marks()
  local json = vim.fn.json_encode(M.marks)
  local f = io.open(M.config.persist_file, "w")
  if f then
    f:write(json)
    f:close()
  end
end

function M.load_marks()
  local f = io.open(M.config.persist_file, "r")
  if f then
    local content = f:read("*a")
    f:close()
    if content and #content > 0 then
      M.marks = vim.fn.json_decode(content)
      -- Restore virtual text only when buffer is loaded
      vim.api.nvim_create_autocmd("BufReadPost", {
        callback = function(ev)
          local bufname = vim.api.nvim_buf_get_name(ev.buf)
          for _, mark in ipairs(M.marks) do
            if mark.filename == bufname then
              local line_count = vim.api.nvim_buf_line_count(ev.buf)
              if mark.lnum > 0 and mark.lnum <= line_count then
                vim.api.nvim_buf_set_extmark(ev.buf, ns, mark.lnum - 1, 0, {
                  virt_text = { { M.config.symbol, M.config.highlight } },
                  virt_text_pos = "eol",
                })
              end
            end
          end
        end,
      })
    end
  end
end

return M
