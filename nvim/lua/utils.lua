local _M = {}

function _M.trimPath(path, fromStart, fromEnd)
  local s = path;
  local function trim(s)
    local i = string.find(s, '/');
    return string.sub(s, i + 1, string.len(s))
  end

  if fromStart and fromStart > 1 then
    if string.sub(path, 1, 1) == '/' then
      s = trim(s)
    end

    for i = 1, fromStart do
      s = trim(s)
    end
  end

  -- return trim(s)
  return (s)
end

function _M.exists(file)
  local ok, _, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      return true
    end
  end
  return ok
end

function _M.execute(command)
  local handler = io.popen(command)
  local response = handler:read('*a'):sub(1, -2)
  handler:close()

  return response
end

function _M.getFileDir()
  return vim.fn.expand('%:p:h')
end

function _M.getRoot()
  local file_dir = _M.getFileDir()
  return _M.execute([[ 
    git_dir=$(git -C ]] .. file_dir .. [[ rev-parse --show-toplevel 2>/dev/null);
    if [ $? -eq 0 ]; then
      echo $git_dir
    else
      echo $PWD
    fi
  ]])
end

function _M.getHome()
  return _M.execute('echo $HOME')
end

function _M.getCwd()
  return vim.cmd'pwd'
end

return _M
