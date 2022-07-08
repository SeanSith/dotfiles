let g:rubycomplete_buffer_loading = 1 
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

compiler ruby

" Ruby tabs
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Proper Ruby block endings
if !exists( "*RubyEndToken" )

  function RubyEndToken()
      let current_line = getline( '.' )
      let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
      let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
        let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

        if match(current_line, braces_at_end) >= 0
          return "\<CR>}\<C-O>O"
        elseif match(current_line, stuff_without_do) >= 0
          return "\<CR>end\<C-O>O"
        elseif match(current_line, with_do) >= 0
          return "\<CR>end\<C-O>O"
        else
          return "\<CR>"
        endif
  endfunction

endif

imap <buffer> <CR> <C-R>=RubyEndToken()<CR>
