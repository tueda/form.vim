" Vim syntax file
" Language:     FORM
" Last Change:  9 Oct 2014
" Filenames:    *.frm

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

syntax match formStatement "\(\(^\|;\)\s*\)\zs\<[a-zA-Z][a-zA-Z0-9]*\>*" contains=formDeclaration,formSpecification,formDefinition,formExecutable,formConditional,formRepeat,formLabel,formTableBase,formOutputControl,formModuleControl,formMixedStatement

syntax case ignore

syntax keyword formOutputControl  contained ab abracket antibracket abrackets antibrackets
syntax keyword formExecutable     contained also
syntax keyword formExecutable     contained antiputinside antiputin aputinside aputin
syntax keyword formExecutable     contained antisymmetrize
syntax keyword formTableBase      contained apply
syntax keyword formExecutable     contained argexplode
syntax keyword formExecutable     contained argimplode
syntax keyword formExecutable     contained argument
syntax match   formDeclaration    "\(\(^\|;\)\s*\)\zs\<\(auto\|autodeclare\)\>" skipwhite nextgroup=formDeclaration
syntax keyword formOutputControl  contained b bracket brackets
syntax keyword formDeclaration    contained c cf cfunction cfunctions
syntax keyword formExecutable     contained chainin
syntax keyword formExecutable     contained chainout
syntax keyword formExecutable     contained chisholm
syntax keyword formDeclaration    contained cleartable
syntax keyword formSpecification  contained collect
syntax keyword formDeclaration    contained commuting
syntax keyword formDeclaration    contained commuteinset
syntax keyword formDeclaration    contained compress
syntax keyword formExecutable     contained contract
syntax keyword formDeclaration    contained ctable
syntax keyword formDeclaration    contained ct ctensor ctensors
syntax keyword formExecutable     contained cyclesymmetrize
syntax keyword formDeclaration    contained deallocatetable
syntax keyword formSpecification  contained delete
syntax keyword formExecutable     contained denominators
syntax keyword formDeclaration    contained dimension
syntax keyword formExecutable     contained discard
syntax keyword formExecutable     contained disorder
syntax keyword formRepeat         contained do
syntax keyword formSpecification  contained drop
syntax keyword formExecutable     contained dropcoefficient
syntax keyword formExecutable     contained dropsymbols
syntax keyword formConditional    contained else
syntax keyword formConditional    contained elseif
syntax keyword formExecutable     contained endargument
syntax keyword formRepeat         contained enddo
syntax keyword formConditional    contained endif
syntax keyword formExecutable     contained endinexpression
syntax keyword formExecutable     contained endinside
syntax keyword formConditional    contained endrepeat
syntax keyword formExecutable     contained endterm
syntax keyword formRepeat         contained endwhile
syntax keyword formExecutable     contained exit
syntax keyword formDeclaration    contained extrasymbols
syntax keyword formExecutable     contained factarg
syntax keyword formExecutable     contained factdollar
syntax keyword formOutputControl  contained factorize
syntax keyword formDeclaration    contained fill
syntax keyword formDeclaration    contained fillexpression
syntax keyword formDeclaration    contained fillindex
syntax keyword formOutputControl  contained format
syntax keyword formExecutable     contained frompolynomial
syntax keyword formDeclaration    contained f function functions
syntax keyword formDeclaration    contained funpowers
syntax keyword formDefinition     contained gf gfactorized globalfactor globalfactorized
syntax keyword formDefinition     contained g global
syntax keyword formExecutable     contained goto
syntax keyword formSpecification  contained hide
syntax keyword formExecutable     contained id identify
syntax keyword formExecutable     contained idnew
syntax keyword formExecutable     contained idold
syntax match   formConditional    "\(\(^\|;\)\s*\)\zs\<if\>" skipwhite nextgroup=formIfCondition
syntax region  formIfCondition    contained start=+(+ end=+)+ contains=formIfCondition,formString,formNestedString,formNone,formNumber,formWildcard,formDollar skipwhite nextgroup=formExecutable
syntax keyword formConditional    contained ifmatch
syntax keyword formConditional    contained ifnomatch
syntax keyword formDeclaration    contained i index indices indexes
syntax keyword formExecutable     contained inexpression
syntax keyword formSpecification  contained inparallel
syntax keyword formExecutable     contained inside
syntax keyword formDeclaration    contained insidefirst
syntax keyword formSpecification  contained intohide
syntax match   formSpecification  contained "\<keep\s\+brackets\>"
syntax keyword formLabel          contained label
syntax keyword formDefinition     contained lf lfactorized localfactor localfactorized
syntax keyword formDeclaration    contained load
syntax keyword formDefinition     contained l local
syntax keyword formExecutable     contained makeinteger
syntax keyword formExecutable     contained many
syntax keyword formExecutable     contained merge
syntax keyword formDeclaration    contained metric
syntax keyword formModuleControl  contained moduleoption
syntax keyword formDeclaration    contained modulus
syntax keyword formExecutable     contained multi
syntax keyword formExecutable     contained multiply
syntax keyword formSpecification  contained ndrop
syntax keyword formOutputControl  contained nfactorize
syntax keyword formDeclaration    contained nf nfunction nfunctions
syntax keyword formSpecification  contained nhide
syntax keyword formExecutable     contained normalize
syntax keyword formSpecification  contained notinparallel
syntax keyword formOutputControl  contained nprint
syntax keyword formSpecification  contained nskip
syntax keyword formDeclaration    contained ntable
syntax keyword formDeclaration    contained nt ntensor ntensors
syntax keyword formOutputControl  contained nunfactorize
syntax keyword formSpecification  contained nunhide
syntax keyword formDeclaration    contained nwrite
syntax keyword formDeclaration    contained off
syntax keyword formDeclaration    contained on
syntax keyword formExecutable     contained once
syntax keyword formExecutable     contained only
syntax keyword formDeclaration    contained polyfun
syntax keyword formDeclaration    contained polyratfun
syntax keyword formSpecification  contained pophide
syntax keyword formMixedStatement contained p
syntax match   formMixedStatement contained "\<print\>\(\[\]\)\?"
syntax keyword formMixedStatement contained printtable
syntax keyword formDeclaration    contained processbucketsize
syntax keyword formDeclaration    contained propercount
syntax keyword formSpecification  contained pushhide
syntax keyword formExecutable     contained putinside putin
syntax keyword formExecutable     contained ratio
syntax keyword formExecutable     contained rcyclesymmetrize
syntax keyword formExecutable     contained redefine
syntax keyword formExecutable     contained renumber
syntax match   formRepeat         "\(\(^\|;\)\s*\)\zs\<repeat\>" skipwhite nextgroup=formExecutable
syntax keyword formExecutable     contained replaceloop
syntax keyword formDeclaration    contained save
syntax keyword formExecutable     contained select
syntax keyword formDeclaration    contained set
syntax keyword formExecutable     contained setexitflag
syntax keyword formExecutable     contained shuffle
syntax keyword formSpecification  contained skip
syntax keyword formDeclaration    contained slavepatchsize
syntax keyword formExecutable     contained sort
syntax keyword formExecutable     contained splitarg
syntax keyword formExecutable     contained splitfirstarg
syntax keyword formExecutable     contained splitlastarg
syntax keyword formExecutable     contained stuffle
syntax keyword formExecutable     contained sum
syntax keyword formDeclaration    contained s symbol symbols
syntax keyword formExecutable     contained symmetrize
syntax keyword formDeclaration    contained table
syntax keyword formTableBase      contained tablebase
syntax keyword formDeclaration    contained t tensor tensors
syntax keyword formExecutable     contained term
syntax keyword formTableBase      contained testuse
syntax keyword formDeclaration    contained threadbucketsize
syntax keyword formExecutable     contained topolynomial
syntax keyword formExecutable     contained totensor
syntax keyword formExecutable     contained tovector
syntax keyword formExecutable     contained trace4
syntax keyword formExecutable     contained tracen
syntax keyword formExecutable     contained transform
syntax keyword formExecutable     contained tryreplace
syntax keyword formOutputControl  contained unfactorize
syntax keyword formSpecification  contained unhide
syntax keyword formDeclaration    contained unittrace
syntax keyword formDeclaration    contained v vector vectors
syntax keyword formRepeat         contained while
syntax keyword formDeclaration    contained write

syntax keyword formFunction       abs_
syntax keyword formFunction       bernoulli_
syntax keyword formFunction       binom_
syntax keyword formFunction       conjg_
syntax keyword formFunction       content_
syntax keyword formFunction       count_
syntax keyword formFunction       d_
syntax keyword formFunction       dd_
syntax keyword formFunction       delta_
syntax keyword formFunction       deltap_
syntax keyword formFunction       denom_
syntax keyword formFunction       distrib_
syntax keyword formFunction       div_
syntax keyword formFunction       dum_
syntax keyword formFunction       dummy_
syntax keyword formFunction       dummyten_
syntax keyword formFunction       e_
syntax keyword formFunction       exp_
syntax keyword formFunction       exteuclidean_
syntax keyword formFunction       extrasymbol_
syntax keyword formFunction       fac_
syntax keyword formFunction       factorin_
syntax keyword formFunction       farg_
syntax keyword formFunction       firstbracket_
syntax keyword formFunction       firstterm_
syntax keyword formFunction       g5_
syntax keyword formFunction       g6_
syntax keyword formFunction       g7_
syntax keyword formFunction       g_
syntax keyword formFunction       gcd_
syntax keyword formFunction       gi_
syntax keyword formFunction       integer_
syntax keyword formFunction       invfac_
syntax keyword formFunction       inverse_
syntax keyword formFunction       makerational_
syntax keyword formFunction       match_
syntax keyword formFunction       max_
syntax keyword formFunction       maxpowerof_
syntax keyword formFunction       min_
syntax keyword formFunction       minpowerof_
syntax keyword formFunction       mod_
syntax keyword formFunction       mod2_
syntax keyword formFunction       nargs_
syntax keyword formFunction       nterms_
syntax keyword formFunction       numfactors_
syntax keyword formFunction       pattern_
syntax keyword formFunction       poly_
syntax keyword formFunction       prime_
syntax keyword formFunction       random_
syntax keyword formFunction       ranperm_
syntax keyword formFunction       rem_
syntax keyword formFunction       replace_
syntax keyword formFunction       reverse_
syntax keyword formFunction       root_
syntax keyword formFunction       setfun_
syntax keyword formFunction       sig_
syntax keyword formFunction       sign_
syntax keyword formFunction       sum_
syntax keyword formFunction       sump_
syntax keyword formFunction       table_
syntax keyword formFunction       tbl_
syntax keyword formFunction       term_
syntax keyword formFunction       termsin_
syntax keyword formFunction       termsinbracket_
syntax keyword formFunction       theta_
syntax keyword formFunction       thetap_

syntax keyword formFunction       sqrt_
syntax keyword formFunction       ln_
syntax keyword formFunction       sin_
syntax keyword formFunction       cos_
syntax keyword formFunction       tan_
syntax keyword formFunction       asin_
syntax keyword formFunction       acos_
syntax keyword formFunction       atan_
syntax keyword formFunction       atan2_
syntax keyword formFunction       sinh_
syntax keyword formFunction       cosh_
syntax keyword formFunction       tanh_
syntax keyword formFunction       asinh_
syntax keyword formFunction       acosh_
syntax keyword formFunction       atanh_
syntax keyword formFunction       li2_
syntax keyword formFunction       lin_

syntax keyword formFunction       coeff_
syntax keyword formFunction       num_
syntax keyword formFunction       den_
syntax keyword formFunction       xarg_
syntax keyword formFunction       dimension_
syntax keyword formFunction       factor_
syntax keyword formFunction       sep_
syntax keyword formFunction       iarg_
syntax keyword formFunction       parg_

syntax keyword formSet            pos_
syntax keyword formSet            pos0_
syntax keyword formSet            neg_
syntax keyword formSet            neg0_
syntax keyword formSet            even_
syntax keyword formSet            odd_
syntax keyword formSet            int_
syntax keyword formSet            symbol_
syntax keyword formSet            fixed_
syntax keyword formSet            index_
syntax keyword formSet            number_
syntax keyword formSet            dummyindices_

syntax match   formComment        "^\*.*$" contains=formTodo
syntax match   formComment        "\;\@<=\s*\*.*$" contains=formTodo
syntax keyword formToDo           contained TODO FIXME XXX

syntax match   formDirective      "^\s*\.\(sort\|end\|store\|global\|clear\)\>"
syntax region  formPreProc        start="^\s*#[a-zA-Z][a-zA-Z]*\>" skip="\\$" end="$"
syntax region  formPreProc        start=+^\s*#\(re\)\?define\s*[^"]*"+ skip=+\\"+ end=+".*$+ contains=formString keepend
syntax match   formPreProc        "^\s*\#[\+\-\:]"
syntax match   formPreProc        "^\s*\#\ze\$" contains=formDollar

syntax region  formString         start=+"+ skip=+\\"+ end=+"+ contains=formSpecial
syntax region  formNestedString   start=+`+ end=+'+ contains=formNestedString
syntax match   formNone           "\[[^\]]\+\]" contains=formNestedString
syntax match   formNumber         "\<\d\+\>"
syntax keyword formNumber         i_
syntax keyword formNumber         pi_

syntax match   formWildcard       "?"
syntax match   formWildcard       "?!\?\([a-zA-Z][a-zA-Z0-9]*_\?\|\[[^]]\+\]\|{[^}]\+}\)\(\[[a-zA-Z][a-zA-Z0-9]*\]\)\?"
syntax match   formDollar         "\$[a-zA-Z][a-zA-Z0-9]*"
syntax match   formDollar         "\$\ze`"

syntax sync ccomment formComment minlines=10

if version >= 508 || !exists("did_form_syn_inits")
  if version < 508
    let did_form_syn_inits = 1
    command -nargs=+ HiLink highlight link <args>
  else
    command -nargs=+ HiLink highlight default link <args>
  endif

  HiLink formDeclaration        Type
  HiLink formSpecification      Type
  HiLink formDefinition         Type
  HiLink formExecutable         Statement
  HiLink formConditional        Conditional
  HiLink formRepeat             Repeat
  HiLink formLabel              Label
  HiLink formTableBase          Statement
  HiLink formOutputControl      StorageClass
  HiLink formModuleControl      StorageClass
  HiLink formMixedStatement     Statement

  HiLink formFunction           Function
  HiLink formSet                Number

  HiLink formComment            Comment
  HiLink formTodo               Todo
  HiLink formPreProc            PreProc
  HiLink formDirective          Delimiter
  HiLink formString             String
  HiLink formNestedString       String
  HiLink formNumber             Number
  HiLink formWildcard           Number
  HiLink formDollar             Number

  delcommand HiLink
endif

let b:current_syntax = "form"

" vim: ft=vim et ts=8 sts=2 sw=2
