require('bufferline').setup({
  options = {
    show_close_icon = flase,
    separator_style = 'slant',
    offsets = {
      {
        filetype = 'NvimTree',
        text = '  Files',
        highlight = '#292c3c',
        text_align = 'left',
      },
    },
    custom_areas = {
      left = function()
        return {
          { text = '    ', fg = '#8fff6d' },
        }
      end,
    },
  },
  highlights = {
    fill = {
      bg = '#292c3c',
    },
    background = {
      bg = '#292c3c',
    },
    tab = {
      bg = '#292c3c',
      bg = '#292c3c',
    },
    close_button = {
      bg = '#292c3c',
      fg = '#292c3c',
    },
    close_button_visible = {
      bg = '#292c3c',
      fg = '#292c3c',
    },
    close_button_selected = {
      fg = '#292c3c',
    },
    buffer_visible = {
      bg = '#292c3c',
    },
    -- modified = {
    --   bg = '#292c3c',
    -- },
    -- modified_visible = {
    --   bg = '#292c3c',
    -- },
    -- duplicate = {
    --   bg = '#292c3c',
    -- },
    -- duplicate_visible = {
    --   bg = '#292c3c',
    -- },
    separator = {
      fg = '#292c3c',
      bg = '#292c3c',
    },
    separator_selected = {
      fg = '#292c3c',
      bg = '#303447', -- Normal
    },
    separator_visible = {
      fg = '#292c3c',
      bg = '#292c3c',
    },
  },  
})
