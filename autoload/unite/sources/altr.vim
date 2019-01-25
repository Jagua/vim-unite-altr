

scriptencoding utf-8


let s:save_cpo = &cpo
set cpo&vim


let s:source = {
\ 'name' : 'altr',
\ 'description' : 'Unite altr',
\ 'default_kind' : 'altr',
\ }


function! s:source.gather_candidates(args, context) abort "{{{
  let current_bufname = bufname('%')
  if empty(current_bufname)
    return []
  endif
  let bufname_list = []
  let direction = 'back'
  let bufname = current_bufname
  while !0
    let bufname = altr#_infer_the_missing_path(bufname, direction, altr#_rule_table())
    if type(bufname) != v:t_string
      if direction ==# 'back'
        let direction = 'forward'
        let bufname = current_bufname
        continue
      elseif direction ==# 'forward'
        break
      endif
    elseif bufname ==# current_bufname
      break
    endif
    call add(bufname_list, bufname)
  endwhile
  return map(bufname_list, '{
  \ "word" : v:val,
  \ "action__path" : v:val,
  \ }')
endfunction "}}}


function! unite#sources#altr#define() abort "{{{
  return s:source
endfunction "}}}


let &cpo = s:save_cpo
unlet s:save_cpo
