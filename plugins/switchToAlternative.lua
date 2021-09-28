function switchToAlternative()
  local TEST_DELIMITER = '.test';
  local TEST_DELIMITER_REGEX = '%.test';
  local GET_FILENAME_REGEX = '^(.+/)([%a_.]+)(%.%a+)$'; -- for cases when path starts with `/`
  -- local GET_FILENAME_REGEX = '^([%a_.]+)(%.%a+)$';
  local IS_TEST_FILE_REGEX = TEST_DELIMITER_REGEX .. '$';
  local GET_FILENAME_BASE_REGEX = '^(.+)' .. TEST_DELIMITER_REGEX .. '$';

  local full_filename = vim.api.nvim_buf_get_name(0);
  local head, filename, ext = full_filename:match(GET_FILENAME_REGEX);
  local isTestFile = type(filename:match(IS_TEST_FILE_REGEX)) == 'string';

  local alternative_file;
  if isTestFile then
    local filename_base = filename:match(GET_FILENAME_BASE_REGEX);
    alternative_file = filename_base ..  ext;
  else
    alternative_file = filename .. TEST_DELIMITER .. ext;
  end

  -- print(isTestFile, alternative_file)

  vim.cmd('e ' .. head .. alternative_file);
end

vim.api.nvim_set_keymap('n', ' a', [[<Cmd>lua switchToAlternative()<cr>]], { noremap = true, silent = false })
