local _M = {}

function _M.trimPath(path, fromStart, fromEnd)
  print('path', path)
  local s = path;
  local startTrimmed = ''
  local endTrimmed = ''

  local function trim(s)
    local i = string.find(s, '/');
    -- print('trim:', s:sub(i + 1), s:sub(1, i))
    return s:sub(i + 1), s:sub(1, i)
  end

  local function backTrim(s)
    local i = string.find(s, "/[^/]*$");
    -- print('back:', s:sub(1, i - 1), s:sub(i))
    return s:sub(1, i - 1), s:sub(i)
  end

  if fromStart and fromStart > 0 then
    if string.sub(path, 1, 1) == '/' then
      s, startTrim = trim(s)
    end

    for i = 1, fromStart do
      local trimmed;
      s, trimmed = trim(s)
      startTrimmed = startTrimmed .. trimmed;
    end
  end

  if fromEnd and fromEnd > 0 then
    if string.sub(path, path:len()) == '/' then
      s, endTrimmed = backTrim(s)
    end

    for i = 1, fromEnd do
      local trimmed;
      s, trimmed = backTrim(s)
      endTrimmed = trimmed .. endTrimmed;
    end
  end

  return s, startTrimmed, endTrimmed
end

function _M.getProjectFilePath(root_path, file_path)
  if root_path:len() > file_path:len() then
    print('ERROR: root_path longer than file_path')
  end
  return file_path:sub(root_path:len() + 2);
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
