" Vim syntax file
" Language:     FlyBase Proforma
" Maintainer:   Damien Goutte-Gattat <dpg44@cam.ac.uk>
" Version:      0.1
" Last Change:  2022 Jul 23

if exists("b:current_syntax")
  finish
endif

" Separator line
syn match fpBoilerplate /^!\+/

" A proforma field
syn region fpFieldHeader start=/^! / end=/:/ contains=fpFieldCode,fpFieldComment,fpFieldClue,fpFieldPlural,fpCuratorTodo
syn match fpFieldCode /[A-Z][A-Z]\?[0-9][0-9]\?[a-z]\?\./ contained
syn match fpFieldComment /([^)]\+)/ contained
syn match fpFieldComment /\[[^]]\+\]/ contained
syn match fpFieldClue /\*[A-Za-z]/ contained
syn match fpFieldPlural /([es])/ contained

" Proforma delimiters
syn match fpProformaHeader /^! [A-Z]\+ PROFORMA \+Version [0-9]\+:.\+$/
syn match fpProformaFooter /^!\+ END OF RECORD FOR THIS PUBLICATION !\+$/

" If a curator has marked a field as a TODO, let's light it up
syn match fpCuratorTodo /TODO:.\+$/
" If a field is empty, light it up as well
syn match fpCuratorTodo / \+:$/

" Style assignments
hi def link fpProformaHeader PreProc
hi def link fpProformaFooter PreProc
hi def link fpBoilerplate PreProc
hi def link fpFieldHeader PreProc
hi def link fpFieldCode Keyword
hi def link fpFieldComment String
hi def link fpFieldClue String
hi def link fpFieldPlural PreProc
hi def link fpCuratorTodo Todo

" Done
let b:current_syntax = "flybasepf"
