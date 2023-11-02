local M = {}

local is_git_repo = function()
  vim.fn.system('git rev-parse --is-inside-work-tree')
  return vim.v.shell_error == 0
end

local get_git_root = function()
  local dot_git_path = vim.fn.finddir('.git', '.;')
  return vim.fn.fnamemodify(dot_git_path, ':h')
end

M.find_files = function()
  local opts = {};
  if is_git_repo() then opts = { cwd = get_git_root() } end
  require('telescope.builtin').find_files(opts)
end

M.git_files = function()
  if is_git_repo() then
    require('telescope.builtin').git_files({ show_untracked = true })
  else
    M.find_files()
  end
end

M.live_grep = function()
  local opts = {};
  if is_git_repo() then opts = { cwd = get_git_root() } end
  require('telescope.builtin').live_grep(opts)
end

M.grep_string = function()
  local opts = {};
  if is_git_repo() then opts = { cwd = get_git_root() } end
  require('telescope.builtin').grep_string(opts)
end

return M
