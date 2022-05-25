local _M = {}

function _M.split(str, delim)
  local parts = {}
  local function addPart(startPart, endPart)
    local p = str:sub(startPart, endPart)
    if p:len() > 0 then
      table.insert(parts, p)
    end
  end
  local l = str:len()

  local s = 0
  for i = 1, l do
    local c = str:sub(i, i)
    if c == delim then
      addPart(s, i - 1)
      s = i + 1
    end
  end
  addPart(s, l)
  return parts;
end

function _M.join(list, delim)
  local s = list[1]
  for i, el in ipairs(list) do
    if i ~= 1 then
      s = s .. delim .. el
    end
  end
  return s
end

function _M.subtable(tab, startIndex, endIndex)
  local sub = {}
  for i = startIndex, endIndex do
    table.insert(sub, tab[i])
  end
  return sub
end

local function trim(s)
  local i = string.find(s, '/');
  return s:sub(i + 1), s:sub(1, i)
end

local function backTrim(s)
  local i = string.find(s, "/[^/]*$");
  return s:sub(1, i - 1), s:sub(i)
end

function _M.trimPathOld(path, fromStart, fromEnd)
  local s = path;
  local startTrimmed = ''
  local endTrimmed = ''

  if string.sub(path, 1, 1) == '/' then
    s, startTrim = trim(s)
  end

  if string.sub(path, path:len()) == '/' then
    s, endTrimmed = backTrim(s)
  end


  if fromStart and fromStart > 0 then
    for i = 1, fromStart do
      local trimmed;
      s, trimmed = trim(s)
      startTrimmed = startTrimmed .. trimmed;
    end
  end

  if fromStart and fromStart < 0 then
    for i = 1, fromStart * -1 do
      local trimmed;
      s, trimmed = trim(s)
      startTrimmed = startTrimmed .. trimmed;
    end
    s, startTrimmed = startTrimmed, s
  end

  if fromEnd and fromEnd > 0 then
    for i = 1, fromEnd do
      local trimmed;
      s, trimmed = backTrim(s)
      endTrimmed = trimmed .. endTrimmed;
    end
  end

  if string.sub(s, 1, 1) == '/' then
    s = trim(s)
  end

  if string.sub(s, path:len()) == '/' then
    s, endTrimmed = backTrim(s)
  end

  return s, startTrimmed, endTrimmed
end

function _M.trimPath(path, fromStart, fromEnd)
  if fromStart == nil then fromStart = 0 end
  if fromEnd == nil then fromEnd = 0 end

  local delim = '/'
  local parts = _M.split(path, delim)

  local startIndex = 1
  local endIndex = #parts

  if fromStart < 0 then
    if fromEnd < 0 then
      endIndex = fromStart * -1
      startIndex = endIndex - fromEnd * -1 + 1
    else
      startIndex = 1
      endIndex = fromStart * -1
    end
  else 
    if fromEnd < 0 then
      startIndex = fromEnd * -1
      endIndex = #parts
    else
      startIndex = fromStart + 1
      endIndex = #parts - fromEnd
    end
  end

  return _M.join(_M.subtable(parts, startIndex, endIndex), delim)
end

function _M.getProjectFilePath(root_path, file_path)
  if root_path:len() > file_path:len() then
    print('ERROR: root_path longer than file_path')
  end
  return file_path:sub(root_path:len() + 2);
end

function _M.getFileRelativePath()
  return _M.getProjectFilePath(_M.getRoot(), _M.getFilePath())
end

function _M.getRelativePath(dir)
  return _M.getProjectFilePath(_M.getRoot(), dir)
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

function _M.getFilePath()
  return vim.fn.expand('%:p')
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

function _M.mergeTables(t1, t2)
  local t1_len = tableLength(t1)
  for index,value in pairs(t2) do
    if (type(index) == "string") then
      t1[index] = value
    else
      t1[t1_len + index] = value
    end
  end
  return t1
end

function tableLength(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

return _M
