

scriptencoding utf-8


let s:save_cpo = &cpo
set cpo&vim


let s:kind = {
\ 'name' : 'altr',
\ 'description' : 'Unite altr',
\ 'parents' : ['openable'],
\ 'default_action' : 'open',
\ 'action_table' : {
\   'open' : {
\     'description' : 'open item',
\   },
\ }
\}


function! s:kind.action_table.open.func(candidate) abort "{{{
  edit `=a:candidate.action__path`
endfunction "}}}


function! unite#kinds#altr#define() abort "{{{
  return s:kind
endfunction "}}}


let &cpo = s:save_cpo
unlet s:save_cpo
