local M = {}

local is_git_repo = function()
  vim.fn.system('git rev-parse --is-inside-work-tree')
  return vim.v.shell_error == 0
end

local get_project_root = function()
  for _, pattern in ipairs({ 'composer.json', 'package.json', 'cargo.toml', 'lazy-lock.json' }) do
    local root = vim.fn.findfile(pattern, '.;')
    if root then return vim.fn.fnamemodify(root, ':h') end
  end
end

M.find_files = function()
  require('telescope.builtin').find_files({ cwd = get_project_root() })
end

M.project_files = function()
  local cwd = get_project_root()

  if cwd then
    require('telescope.builtin').find_files({ cwd = cwd })
  else
    if is_git_repo then
      require('telescope.builtin').git_files({ show_untracked = true })
    end
  end
end

M.git_files = function()
  require('telescope.builtin').git_files({ show_untracked = true })
end

M.live_grep = function()
  require('telescope.builtin').live_grep({ cwd = get_project_root() })
end

M.grep_string = function()
  require('telescope.builtin').grep_string({ cwd = get_project_root() })
end

return M
