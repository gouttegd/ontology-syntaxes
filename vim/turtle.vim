" Vim syntax file
" Language:     Turtle (Terse RDF Triple Language)
" Maintainer:   Damien Goutte-Gattat <dpg44@cam.ac.uk>
" Version:      0.1
" Last Change:  2022 Oct 23

if exists("b:current_syntax")
  finish
endif

" IRIs and compact IRIs
syn match ttlIRI /<[^>]\+>/
syn match ttlPrefix /\(\h[-._[:alnum:]]*\)\?:/
syn match ttlPrefixedName /\(\h[-._[:alnum:]]*\)\?:[-._:[:alnum:]]\+/ contains=ttlPrefix

" Type tag (e.g. `^^xsd:string`)
syn match ttlType /\^^\s*\h[-._[:alnum:]]*:\h[-._[:alnum:]]*/

" Language tag (e.g. `@en`)
syn match ttlLang /@[a-z]\{2,3}/

" Prefix and base declarations
syn match ttlPrefDecl /^@prefix\s\+/
syn match ttlPrefDecl /^PREFIX\s\+/
syn match ttlPrefDecl /^@base\s\+/
syn match ttlPrefDecl /^BASE\s\+/

" Other constructs
syn match ttlComment /#.*$/
syn region ttlString start=/"/ skip=/\\"/ end=/"/
syn match ttlTerminator /[.;,]/
syn match ttlBlankDelimiters /[[\]]/


"""""""""""""""""""""
" Style assignments "
"""""""""""""""""""""

hi def link ttlComment Comment
hi def link ttlString Constant
hi def link ttlType Type
hi def link ttlLang Type
hi def link ttlIRI Identifier
hi def link ttlPrefix PreProc
hi def link ttlPrefixedName Identifier
hi def link ttlPrefDecl Statement
hi def link ttlTerminator Statement
hi def link ttlBlankDelimiters Statement

" Done
let b:current_syntax = "turtle"
