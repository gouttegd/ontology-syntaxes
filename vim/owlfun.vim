" Vim syntax file
" Language:     OWL Functional Syntax
" Maintainer:   Damien Goutte-Gattat <dpg44@cam.ac.uk>
" Version:      0.1
" Last Change:  2022 Jul 23

if exists("b:current_syntax")
  finish
endif

""""""""""""""""""""""
" General constructs "
""""""""""""""""""""""

syn match ofnComment /#.*$/
syn region ofnString start=/"/ skip=/\\"/ end=/"/

" Type tag (e.g. `^^xsd:string`)
syn match ofnType /\^^\s*\h[-._[:alnum:]]*:\h[-._[:alnum:]]*/

" Language tag (e.g. `@en`)
syn match ofnLang /@[a-z]\{2,3}/

" IRIs and compact IRIs
syn match ofnIRI /<[^>]\+>/
syn match ofnPrefix /\h[-._[:alnum:]]*:/
syn match ofnCURIE  /\h[-._[:alnum:]]*:\h[-._[:alnum:]]*/ contains=ofnPrefix


""""""""""""
" Keywords "
""""""""""""

syn keyword ofnGeneralStatement Prefix Ontology Import Declaration
            \ Class Datatype ObjectProperty DataProperty AnnotationProperty
            \ NamedInvidual Annotation AnnotationAssertion
            \ SubAnnotationPropertyOf AnnotationPropertyDomain
            \ AnnotationPropertyRange ObjectInverseOf

syn keyword ofnDataStatement DataIntersectionOf DataUnionOf DataCOmplementOf
            \ DataOneOf DatatypeRestriction

syn keyword ofnClassExpression ObjectIntersectionOf ObjectUnionOf
            \ ObjectComplementOf ObjectOneOf ObjectSomeValuesFrom
            \ ObjectAllValuesFrom ObjectHasValue ObjectHasSelf
            \ ObjectMinCardinality ObjectMaxCardinality ObjectExactCardinality
            \ DataSomeValuesFrom DataAllValuesFrom DataHasValue
            \ DataMinCardinality DataMaxCardinality DataExactCardinality

syn keyword ofnAxiom SubClassOf EquivalentClasses DisjointClasses
            \ DisjointUnion DatatypeDefinition HasKey

syn keyword ofnObjectPropertyAxiom SubObjectPropertyOf ObjectPropertyChain
            \ EquivalentObjectProperties DisjointObjectProperties
            \ ObjectPropertyDomain ObjectPropertyRange InverseObjectProperties
            \ FunctionalObjectProperty InverseFunctionalObjectProperty
            \ ReflexiveObjectProperty IrreflexiveObjectProperty
            \ SymmetricObjectProperty AsymmetricObjectProperty
            \ TransitiveObjectProperty

syn keyword ofnDataPropertyAxiom SubDataPropertyOf EquivalentDataProperties
            \ DisjointDataProperties DataPropertyDomain DataPropertyRange
            \ FunctionalDataProperty

syn keyword ofnAssertion SameIndividual DifferentIndividuals ClassAssertion
            \ ObjectPropertyAssertion NegativeObjectPropertyAssertion
            \ DataPropertyAssertion NegativeDataPropertyAssertion


"""""""""""""""""""""
" Style assignments "
"""""""""""""""""""""

hi def link ofnComment Comment
hi def link ofnString Constant
hi def link ofnType Type
hi def link ofnLang Type
hi def link ofnIRI Identifier
hi def link ofnPrefix PreProc
hi def link ofnCURIE Identifier
hi def link ofnGeneralStatement Statement
hi def link ofnDataStatement Statement
hi def link ofnClassExpression Statement
hi def link ofnAxiom Statement
hi def link ofnObjectPropertyAxiom Statement
hi def link ofnDataPropertyAxiom Statement
hi def link ofnAssertion Statement

" Done
let b:current_syntax = "owlfun"
