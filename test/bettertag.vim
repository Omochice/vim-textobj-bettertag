let s:suite = themis#suite('bettertag')
" let s:scope = themis#helper('scope')
let s:parent = themis#suite('parent')
" let s:funcs = s:scope.funcs("autoload/textobj/bettertag")

function! s:suite.before_each() abort
  call setreg(v:register, '')
  enew!
endfunction

" Positive test
function! s:suite.__positive_normal__() abort
  let l:multi = themis#suite('If tag is multi line, select should not have first line')
  function! l:multi.test() abort
    let l:lines = [
          \   '<div>',
          \   '  sample',
          \   '</div>',
          \ ]
    call setline(
          \   1,
          \   l:lines,
          \ )
    call cursor(2, 1)
    execute 'normal' "y\<Plug>(textobj-bettertag-i)"
    call assert_equal(l:lines[1] .. "\n", getreg(v:register))
  endfunction

  let l:single = themis#suite('If tag is single line, select should be same as orginal it')
  function! l:single.test() abort
    let l:lines = ['<div>sample</div>']
    call setline(1, l:lines)
    call cursor(1, 6)
    execute 'normal' "y\<Plug>(textobj-bettertag-i)"
    let l:save_reg = getreg(v:register)
    normal! yit
    call assert_equal(getreg(v:register), l:save_reg)
  endfunction
endfunction

function! s:suite.__positive_visual__() abort
  let l:multi = themis#suite('If tag is multi line, select should not have first line')
  function! l:multi.test() abort
    let l:lines = [
          \   '<div>',
          \   '  sample',
          \   '</div>',
          \ ]
    call setline(
          \   1,
          \   l:lines,
          \ )
    call cursor(2, 1)
    " NOTE: FIXME: "v\<Plug>(textobj-bettertag-i)y" not work well
    execute 'normal' "v\<Plug>(textobj-bettertag-i)"
    normal! y
    call assert_equal(l:lines[1] .. "\n", getreg(v:register))
  endfunction

  let l:single = themis#suite('If tag is single line, select should be same as orginal it')
  function! l:single.test() abort
    let l:lines = ['<div>sample</div>']
    call setline(1, l:lines)
    call cursor(1, 6)
    " NOTE: FIXME: "v\<Plug>(textobj-bettertag-i)y" not work well
    execute 'normal' "v\<Plug>(textobj-bettertag-i)"
    normal! y
    let l:save_reg = getreg(v:register)
    normal! vity
    call assert_equal(getreg(v:register), l:save_reg)
  endfunction
endfunction

function! s:suite.__negative__() abort
  let l:out_of_tag = themis#suite('If cursor is out of tag, should not copy anything')
  function! l:out_of_tag.test() abort
    call setreg(v:register, 'this should be saved')
    let l:save_reg = getreg(v:register)
    let l:lines = [
          \   '<div>',
          \   '  sample',
          \   '</div>',
          \   '',
          \   '',
          \ ]
    normal! G
    execute 'normal' "y\<Plug>(textobj-bettertag-i)"
    call assert_equal(l:save_reg, getreg(v:register))
  endfunction
endfunction
