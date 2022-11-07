let s:save_cpo = &cpo
set cpo&vim

function! textobj#bettertag#inner() abort
  normal! vit
  call feedkeys("\<Esc>", 'nx') " need??
  let l:head = getpos("'<")
  let l:tail = getpos("'>")
  if getline(l:head[1]) =~# '^\s*<.\+>\s*$' && l:head[1] !=# l:tail[1]
    let l:head[1] = l:head[1] + 1
    let l:head[2] = 1
  endif
  if l:head ==# l:tail
    return 0 " no match
  endif
  return ['v', l:head, l:tail]
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
