local _M = {}
__TEST = {
  tests = {},
  current = nil,
  isOnly = false
}

local FAILED = 'FAILED'
local OK = 'OK'
local SKIPPED = 'SKIPPED'

function _M.test(description, callback)
  local test = { 
    description = description, 
    callback = callback,
    errors = {},
    only = false
  }
  table.insert(__TEST.tests, test)
end

function _M.otest(description, callback)
  if __TEST.isOnly == false then
    __TEST.isOnly = true
  end
  local test = { 
    description = description, 
    callback = callback,
    errors = {},
    only = true
  }
  table.insert(__TEST.tests, test)
end

function _M.assert(a, b)
  if a ~= b then
    table.insert(__TEST.current.errors, { message = 'a is not equal b', actual = a, expected = b })
  end
end

function _M.assert_deep(a, b)
  if vim.inspect(a) ~= vim.inspect(b) then
    table.insert(__TEST.current.errors, { message = 'a is not equal b', actual = a, expected = b })
  end
end

function _M.__finish()
  local failed = {}
  local errors = {}

  for i, test in pairs(__TEST.tests) do
    __TEST.current = test

    local status
    if __TEST.isOnly then
      if test.only then
        test.callback()
        if table.getn(test.errors) > 0 then
          status = FAILED
          errors[test.description] = test.errors
        else
          status = OK
        end
      else
        status = SKIPPED
      end
    else
        test.callback()
        if table.getn(test.errors) > 0 then
          status = FAILED
          errors[test.description] = test.errors
        else
          status = OK
        end
      end
    print(status .. '  ' .. test.description)
  end

  for name, testErrors in pairs(errors) do
    print(' \n')
    print('      Error: ' .. name .. ' \n')
    for i, error in pairs(testErrors) do
      print('- Actual - + Expected')
      print(' \n')
      print('- ' .. vim.inspect(error.actual))
      print('+ ' .. vim.inspect(error.expected))
    end
  end

  print('\n')
end

return _M
