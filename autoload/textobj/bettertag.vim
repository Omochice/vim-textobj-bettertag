let s:save_cpo = &cpo
set cpo&vim

function! textobj#bettertag#inner() abort
  normal! vit
  call feedkeys("\<Esc>", 'nx') " need??
  let l:head = getpos("'<")
  let l:tail = getpos("'>")
  if l:head ==# l:tail
    return 0 " no match
  endif
  " if match only space string, skip this line
  if getline(l:head[1])->strpart(l:head[2]-1) =~# '^\s*$'
    let l:head[1] = l:head[1] + 1
    let l:head[2] = 1
  endif
  " if match only space string, skip this line
  if l:head[1] !=# l:tail[1] && getline(l:tail[1])->strpart(l:tail[2]-1) =~# '\S'
    let l:tail[1] = l:tail[1] - 1
    let l:tail[2] = getline(l:tail[1])->len() + 1
  endif
  return ['v', l:head, l:tail]
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
