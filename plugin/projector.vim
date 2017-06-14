function! s:apply_locals()
  let l:locals = findfile('Project.vim', '.;')

  if !filereadable(l:locals)
    let l:locals = findfile('.project.vim', '.;')
  endif

  if filereadable(l:locals)
    exec ':source '.l:locals
  endif
endfunction


augroup Projector 
  autocmd!
  autocmd BufNewFile,BufRead,VimEnter * call s:apply_locals()
augroup END
