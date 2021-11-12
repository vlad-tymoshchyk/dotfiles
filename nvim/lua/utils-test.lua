local al = require'assertion_library'
local u = require'utils'

local test = al.test;
local otest = al.otest;
local assert = al.assert;
local assert_deep = al.assert_deep;

test('split function', function()
  assert_deep(u.split('some', '/'), { 'some' })
  assert_deep(u.split('some', 'o'), { 's', 'me' })
  assert_deep(u.split('oreo', 'o'), { 're' })
  assert_deep(u.split('/some/here/there/', '/'), { 'some', 'here', 'there' })
end)

test('trimPath without anything to change', function()
  local a = 'some/path/here'
  assert(u.trimPath(a), a)
  assert(u.trimPath(a, 0), a)
  assert(u.trimPath(a, 0, 0), a)
end)

test('trimPath with start and end slashes', function()
  local a = '/some/path/here/'
  local b = 'some/path/here'
  assert(u.trimPath(a), b)
  assert(u.trimPath(a, 0), b)
  assert(u.trimPath(a, 0, 0), b)
end)

test('trimPath to trim start part', function()
  local a1 = '/some/path/here'
  local a2 = 'some/path/here'
  local b = 'path/here'
  assert(u.trimPath(a1, 1), b)
  assert(u.trimPath(a2, 1), b)
end)

test('trimPath to trim end part', function()
  local a = '/some/path/here'
  local b = 'some'
  assert(u.trimPath(a, 0, 2), b)
end)

test('trimPath to trim negative start part', function()
  local a = '/some/path/here'
  local b = 'some'
  assert(u.trimPath(a, -1), b)
end)

test('trimPath to trim negative end part', function()
  local a = '/some/path/here'
  local b = 'path/here'
  assert(u.trimPath(a, 0, -2), b)
end)

test('trimPath to trim negative both parts', function()
  local a = '/some/path/here/and/there'
  local b = 'path/here'
  assert(u.trimPath(a, -3, -2), b)
end)
