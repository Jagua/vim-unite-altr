

scriptencoding utf-8


let s:save_cpo = &cpo
set cpo&vim


let s:source = {
\ 'name' : 'altr',
\ 'description' : 'Unite altr',
\ 'default_kind' : 'altr',
\ }


function! s:source.gather_candidates(args, context) abort "{{{
  let pwd = expand('%:p')
  let cwd = pwd
  let files = []
  while !0
    call add(files, pwd)
    let path = altr#_infer_the_missing_path(pwd, 'forward', altr#_rule_table())
    if type(path) == type('')
      let pwd = path
      if pwd == cwd
        break
      endif
    else
      break
    endif
    unlet path
  endwhile
  return map(files, '{
  \ "word" : v:val,
  \ "action__path" : v:val,
  \ }')
endfunction "}}}


function! unite#sources#altr#define() abort "{{{
  return s:source
endfunction "}}}


let &cpo = s:save_cpo
unlet s:save_cpo
