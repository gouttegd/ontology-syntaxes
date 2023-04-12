" Vim syntax file
" Language:     OBO Flatfile Format
" Maintainer:   Damien Goutte-Gattat <dpg44@cam.ac.uk>
" Version:      0.1
" Last Change:  2022 Jul 23

if exists("b:current_syntax")
  finish
endif

" We need `-` as a keyword character as many OBO tags contain a dash.
setlocal iskeyword+=-

" All tags that can be found in the header frame.
syn keyword oboHeaderTag format-version data-version version ontology date
            \ saved-by auto-generated-by subsetdef import synonymtypedef
            \ idspace default-relationship-id-prefix id-mapping remark
            \ treat-xref-as-equivalent treat-xref-as-genus-differentia
            \ treat-xref-as-relationship treat-xref-as-is_a
            \ relax-unique-identifier-assumption-for-namespace namespace
            \ relax-unique-label-assumption-for-namespace default-namespace

" All tags that can be found in a term frame.
syn keyword oboStanzaTag id name is_anonymous alt_id def comment subset
            \ synonym exact_synonym narrow_synonym broad_synonym xref
            \ xref_analog xref_unk is_a intersection_of union_of disjoint_from
            \ relationship is_obsolete replaced_by consider use_term builtin
            \ created_by creation_date property_value domain range inverse_of
            \ transitive_over is_cyclic is_reflexive is_symmetric
            \ is_anti_symmetric is_transitive is_metadata_tag is_class_level
            \ instance_of

" Constructs found in a OBO tag line
syn match oboTermIdentifier /[a-zA-Z]\+\(:\|_\)[0-9a-zA-Z_]\+/
syn match oboCommentedIdentifier / ! .\+/
syn region oboCrossReference start=/\[/ end=/\]/ contains=oboTermIdentifier
syn region oboLiteralString start=/"/ end=/"/

" Miscellaneous keywords and frequently used relationships
syn keyword oboSynonymScope EXACT RELATED NARROW RELATED
syn keyword oboMiscKeyword deprecated true false
syn keyword oboRelationship attached_to attached_to_part_of capable_of
            \ capable_of_part_of characteristic_of composed_primarily_of
            \ continuous_with develops_directly_from develops_from
            \ develops_from_part_of develops_into
            \ electrically_synapsed_to expresses fasciculates_with
            \ has_characteristic has_fasciculating_neuron_projection
            \ has_part has_sensory_dendrite_in has_soma_location
            \ has_synaptic_IO_in has_synaptic_IO_throughout innervated_by
            \ innervates overlaps part_of receives_input_from
            \ receives_synaptic_input_from_neuron
            \ receives_synaptic_input_in_region 
            \ receives_synaptic_input_throughout 
            \ sends_synaptic_output_throughout sends_synaptic_output_to_cell
            \ sends_synaptic_output_to_region synapsed_via_type_III_bouton_to
            \ synapsed_via_type_II_bouton_to synapsed_via_type_Ib_bouton_to
            \ synapsed_via_type_Is_bouton_to

" A tag line
syn region oboTagValue start=/: / end=/$/ contains=oboTermIdentifier,oboCommentedIdentifier,oboLiteralString,oboSynonymScope,oboMiscKeyword,oboRelationship,oboCrossReference
syn region oboTagLine start=/^[a-z_-]\+:/ end=/$/ contains=oboHeaderTag,oboStanzaTag,oboTagValue keepend

" A stanza header
syn match oboStanza /^\[\(Term\|Typedef\|Instance\)\]$/

" Style assignments
hi def link oboStanza Type
hi def link oboHeaderTag Statement
hi def link oboStanzaTag Statement
hi def link oboTermIdentifier Identifier
hi def link oboLiteralString Constant
hi def link oboCrossReference Identifier
hi def link oboCommentedIdentifier Comment
hi def link oboSynonymScope Special
hi def link oboMiscKeyword Special
hi def link oboRelationShip Preproc

" Done
let b:current_syntax = "obo"
