local function cscope_status()
	return
	--return vim.g.cscope_maps_statusline_indicator
	--return [[ HELLEO ]]
end

local function get_func_name()
	local filetype = vim.bo.filetype
	local function_node_types = {
		lua = 'function_declaration',
		python = 'function_definition', 
		c = 'function_definition',
		cpp = 'function_definition',
	}

	local target_type = function_node_types[filetype]
	if not target_type then
		return ''
	end

	-- Get parser and parse tree
	local ok, parser = pcall(vim.treesitter.get_parser, 0)
	if not ok or not parser then
		return ''
	end

	local trees = parser:parse()
	if not trees or not trees[1] then
		return ''
	end

	-- Get node at cursor position
	local cursor = vim.api.nvim_win_get_cursor(0)
	local row, col = cursor[1] - 1, cursor[2]
	local node = trees[1]:root():named_descendant_for_range(row, col, row, col)

	if not node then
		return ''
	end

	-- Walk up the tree to find function node
	while node do
		if node:type() == target_type then
			break
		end
		node = node:parent()
	end

	if not node then
		return ''
	end

	-- Extract function name based on language
	local name_extractors = {
		lua = function(n) return n:named_child(0) end,
		python = function(n) return n:field('name')[1] end,
		c = function(n)
			local declarator = n:field('declarator')[1]
			while declarator and declarator:type() ~= 'identifier' do
				if declarator:type() == 'function_declarator' then
					declarator = declarator:field('declarator')[1]
				else
					declarator = declarator:named_child(0)
				end
			end
			return declarator
		end,
	}
	name_extractors.cpp = name_extractors.c

	local extractor = name_extractors[filetype]
	if not extractor then
		return ''
	end

	local name_node = extractor(node)
	if name_node then
		return vim.treesitter.get_node_text(name_node, 0) or ''
	end

	return ''
end

return {
	'nvim-lualine/lualine.nvim',
	version = '*',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('lualine').setup {

			sections = {
				lualine_a = { 'mode', 'vim.g.cscope_maps_statusline_indicator'},
				lualine_b = {
					{
						'diff', 'diagnostics',
						maxlength = 20,
						shorting_target = 40,
					}
				},
				lualine_c = {
				    {
				      'filename',
				      file_status = true,      -- Displays file status (readonly status, modified status)
				      newfile_status = false,  -- Display new file status (new file means no write after created)
				      path = 1,                -- 0: Just the filename
				                               -- 1: Relative path
				                               -- 2: Absolute path
				                               -- 3: Absolute path, with tilde as the home directory
				                               -- 4: Filename and parent dir, with tilde as the home directory
				
				      shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
				                               -- for other components. (terrible name, any suggestions?)
				      symbols = {
				        modified = '[+]',      -- Text to show when the file is modified.
				        readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
				        unnamed = '[No Name]', -- Text to show for unnamed buffers.
				        newfile = '[New]',     -- Text to show for newly created file before first write
				      }
				    },
				    { get_func_name }
				}
			}
		}
	end
}
