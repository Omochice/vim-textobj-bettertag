if get(g:, 'loaded_textobj_better_tag', v:false)
  finish
endif
let g:loaded_textobj_better_tag = v:true
echomsg 'debug'

let s:save_cpo = &cpo
set cpo&vim

call textobj#user#plugin('bettertag', {
      \ '-': {
      \ 'select-i': [], 'select-i-function': 'textobj#bettertag#inner',
      \ },
      \ })

let &cpo = s:save_cpo
unlet s:save_cpo
