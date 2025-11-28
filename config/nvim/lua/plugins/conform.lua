local function find_config_file(filename, bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local buf_path = vim.api.nvim_buf_get_name(bufnr)
  local start_dir = buf_path ~= "" and vim.fn.fnamemodify(buf_path, ":p:h") or vim.fn.getcwd()
  local found = vim.fn.findfile(filename, start_dir .. ";")
  return found ~= "" and found or nil
end

local function check_package_json_for_config(bufnr, field)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local buf_path = vim.api.nvim_buf_get_name(bufnr)
  local start_dir = buf_path ~= "" and vim.fn.fnamemodify(buf_path, ":p:h") or vim.fn.getcwd()

  local function check_path(current_path)
    local package_json = current_path .. "/package.json"
    if vim.fn.filereadable(package_json) == 1 then
      local content = vim.fn.readfile(package_json)
      local json_str = table.concat(content, "\n")
      local ok, parsed = pcall(vim.fn.json_decode, json_str)
      if ok and parsed then
        if field == "eslint" and (parsed.eslintConfig or (parsed.devDependencies and parsed.devDependencies.eslint) or (parsed.dependencies and parsed.dependencies.eslint)) then
          return true
        end
        if field == "prettier" and ((parsed.devDependencies and parsed.devDependencies.prettier) or (parsed.dependencies and parsed.dependencies.prettier)) then
          return true
        end
      end
    end
    local parent = vim.fn.fnamemodify(current_path, ":h")
    if parent == current_path then
      return false
    end
    return check_path(parent)
  end

  return check_path(start_dir)
end

local function get_formatter_for_filetype(bufnr)
  local eslint_config = find_config_file("eslint.config.js", bufnr)
    or find_config_file("eslint.config.mjs", bufnr)
    or find_config_file("eslint.config.cjs", bufnr)
    or find_config_file(".eslintrc", bufnr)
    or find_config_file(".eslintrc.js", bufnr)
    or find_config_file(".eslintrc.cjs", bufnr)
    or find_config_file(".eslintrc.json", bufnr)
    or find_config_file(".eslintrc.yaml", bufnr)
    or find_config_file(".eslintrc.yml", bufnr)
    or check_package_json_for_config(bufnr, "eslint")

  local prettier_config = find_config_file(".prettierrc", bufnr)
    or find_config_file(".prettierrc.json", bufnr)
    or find_config_file(".prettierrc.js", bufnr)
    or find_config_file(".prettierrc.cjs", bufnr)
    or find_config_file(".prettierrc.mjs", bufnr)
    or find_config_file("prettier.config.js", bufnr)
    or find_config_file("prettier.config.cjs", bufnr)
    or find_config_file("prettier.config.mjs", bufnr)
    or find_config_file(".prettierrc.yaml", bufnr)
    or find_config_file(".prettierrc.yml", bufnr)
    or find_config_file("prettier.config.yaml", bufnr)
    or find_config_file("prettier.config.yml", bufnr)
    or check_package_json_for_config(bufnr, "prettier")

  local biome_config = find_config_file("biome.json", bufnr)

  if eslint_config or prettier_config then
    return { "prettier" }
  elseif biome_config then
    return { "biome" }
  else
    return { "biome" }
  end
end

return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function()
    local conform = require("conform")
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
    vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

    local base_formatters = {
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      ["markdown.mdx"] = { "prettier" },
      graphql = { "prettier" },
      handlebars = { "prettier" },
    }

    local js_fts = {
      javascript = true,
      javascriptreact = true,
      typescript = true,
      typescriptreact = true,
      vue = true,
      svelte = true,
    }

    local original_format = conform.format
    conform.format = function(opts, on_complete)
      opts = opts or {}
      local bufnr = opts.buf or vim.api.nvim_get_current_buf()
      local ft = vim.bo[bufnr].filetype

      if js_fts[ft] then
        local formatters = get_formatter_for_filetype(bufnr)
        opts.formatters = formatters
      end

      return original_format(opts, on_complete)
    end

    return {
      formatters_by_ft = base_formatters,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        biome = {
          require_cwd = true,
          command = "biome",
          args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
          stdin = true,
        },
      },
    }
  end,
}
