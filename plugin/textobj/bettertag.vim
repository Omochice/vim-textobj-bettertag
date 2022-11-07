if get(g:, 'loaded_textobj_bettertag', v:false)
  finish
endif
let g:loaded_textobj_bettertag = v:true

let s:save_cpo = &cpo
set cpo&vim

call textobj#user#plugin('bettertag', {
      \ '-': {
      \ 'select-i': [], 'select-i-function': 'textobj#bettertag#inner',
      \ },
      \ })

let &cpo = s:save_cpo
unlet s:save_cpo
