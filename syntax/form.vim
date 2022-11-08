" Vim syntax file
" Language:     FORM
" Filenames:    *.frm

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("g:form_minlines")
  let g:form_minlines = 20
endif
if !exists("g:form_makeunderscoreletter")
  let g:form_makeunderscoreletter = 0
endif
if !exists("g:form_makeatletter")
  let g:form_makeatletter = 0
endif

syntax case match

syntax match   formStatementBegin /\(^\|;\)\s*\zs\ze[a-zA-Z_]/ nextgroup=formDeclaration,formSpecification,formDefinition,formExecutable,formConditional,formRepeat,formLabel,formTableBase,formOutputControl,formModuleControl,formMixedStatement

syntax match   formPreProcBegin   /^\s*\zs\ze#[a-zA-Z_]/ nextgroup=formPreProcFirst
syntax match   formPreProcFirst   /#[a-zA-Z_][a-zA-Z0-9_]*/ contains=formPreProcHead,formPreProcCommand nextgroup=formPreProcBody
syntax match   formPreProcHead    contained /#/
syntax region  formPreProcBody    contained start=// skip=/\\$/ end=/$/ contains=formPreProcString
syntax region  formPreProcString  contained start=/"/ skip=/\\"/ end=/"/

syntax match   formSetupBegin     /^\s*\#:/ nextgroup=formSetupFirst
syntax match   formSetupFirst     /#:\s*[a-zA-Z_][a-zA-Z0-9_]*/ contains=formSetupHead,formSetupKeyword nextgroup=formSetupBody
syntax match   formSetupHead      contained /#:/
syntax region  formSetupBody      contained start=// end=/$/

syntax match   formPreProc        /^\s*\#[\+\-]/
syntax match   formPreProc        /^\s*\#\s*\ze\$/

syntax match   formComment        /^\*.*$/ contains=formTodo,@Spell
syntax match   formComment        /;\zs\s*\*.*$/ contains=formTodo,@Spell
syntax keyword formToDo           contained TODO FIXME XXX

syntax match   formDirective      /^\s*\.\(sort\|end\|store\|global\|clear\)\>/

syntax region  formString         start=/"/ skip=/\\"/ end=/"/ contains=@Spell
syntax region  formNestedString   start=/`/ end=/'/ contains=formNestedString
syntax match   formFormalName     /\[[^\]]\+\]/ contains=formNestedString
syntax match   formNumber         /\<\d\+\>/
syntax keyword formNumber         i_
syntax keyword formNumber         pi_

syntax match   formWildcard       /?/
syntax match   formWildcard       /?!\?\([a-zA-Z][a-zA-Z0-9]*_\?\|\[[^]]\+\]\|{[^}]\+}\)\(\[[a-zA-Z][a-zA-Z0-9]*\]\)\?/
if g:form_makeunderscoreletter
  syntax match formWildcard       /?!\?\([a-zA-Z_][a-zA-Z_0-9]*\|\[[^]]\+\]\|{[^}]\+}\)\(\[[a-zA-Z_][a-zA-Z_0-9]*\]\)\?/
endif
if g:form_makeatletter
  syntax match formWildcard       /?!\?\([a-zA-Z@][a-zA-Z@0-9]*_\?\|\[[^]]\+\]\|{[^}]\+}\)\(\[[a-zA-Z@][a-zA-Z@0-9]*\]\)\?/
endif
syntax match   formDollar         /\$[a-zA-Z][a-zA-Z0-9]*/
if g:form_makeunderscoreletter
  syntax match formDollar         /\$[a-zA-Z_][a-zA-Z_0-9]*/
endif
if g:form_makeatletter
  syntax match formDollar         /\$[a-zA-Z@][a-zA-Z@0-9]*/
endif
syntax match   formDollar         /\$\ze`/

syntax case ignore

syntax keyword formPreProcCommand contained add
syntax keyword formPreProcCommand contained addseparator
syntax keyword formPreProcCommand contained append
syntax keyword formPreProcCommand contained appendpath
"syntax keyword formPreProcCommand contained assign
syntax keyword formPreProcCommand contained break
syntax keyword formPreProcCommand contained breakdo
syntax keyword formPreProcCommand contained call
syntax keyword formPreProcCommand contained case
syntax keyword formPreProcCommand contained clearoptimize
syntax keyword formPreProcCommand contained close
syntax keyword formPreProcCommand contained closedictionary
syntax keyword formPreProcCommand contained commentchar
syntax keyword formPreProcCommand contained create
syntax keyword formPreProcCommand contained debug
syntax keyword formPreProcCommand contained default
syntax keyword formPreProcCommand contained define
syntax keyword formPreProcCommand contained do
syntax keyword formPreProcCommand contained else
syntax keyword formPreProcCommand contained elseif
syntax keyword formPreProcCommand contained enddo
syntax keyword formPreProcCommand contained endif
syntax keyword formPreProcCommand contained endinside
syntax keyword formPreProcCommand contained endprocedure
syntax keyword formPreProcCommand contained endswitch
syntax keyword formPreProcCommand contained exchange
syntax keyword formPreProcCommand contained external
syntax keyword formPreProcCommand contained factdollar
syntax keyword formPreProcCommand contained fromexternal
syntax keyword formPreProcCommand contained if
syntax keyword formPreProcCommand contained ifdef
syntax keyword formPreProcCommand contained ifndef
syntax keyword formPreProcCommand contained include
syntax keyword formPreProcCommand contained inside
syntax keyword formPreProcCommand contained message
syntax keyword formPreProcCommand contained opendictionary
syntax keyword formPreProcCommand contained optimize
syntax keyword formPreProcCommand contained pipe
syntax keyword formPreProcCommand contained preout
syntax keyword formPreProcCommand contained prependpath
syntax keyword formPreProcCommand contained printtimes
syntax keyword formPreProcCommand contained procedure
syntax keyword formPreProcCommand contained procedureextension
syntax keyword formPreProcCommand contained prompt
syntax keyword formPreProcCommand contained redefine
syntax keyword formPreProcCommand contained remove
syntax keyword formPreProcCommand contained reset
syntax keyword formPreProcCommand contained reverseinclude
syntax keyword formPreProcCommand contained rmexternal
syntax keyword formPreProcCommand contained rmseparator
syntax keyword formPreProcCommand contained setexternal
syntax keyword formPreProcCommand contained setexternalattr
syntax keyword formPreProcCommand contained setrandom
syntax keyword formPreProcCommand contained show
syntax keyword formPreProcCommand contained skipextrasymbols
syntax keyword formPreProcCommand contained switch
syntax keyword formPreProcCommand contained system
syntax keyword formPreProcCommand contained terminate
syntax keyword formPreProcCommand contained timeoutafter
syntax keyword formPreProcCommand contained toexternal
syntax keyword formPreProcCommand contained undefine
syntax keyword formPreProcCommand contained usedictionary
syntax keyword formPreProcCommand contained write

syntax keyword formSetupKeyword   contained bracketindexsize
syntax keyword formSetupKeyword   contained commentchar
syntax keyword formSetupKeyword   contained compresssize
syntax keyword formSetupKeyword   contained constindex
syntax keyword formSetupKeyword   contained continuationlines
syntax keyword formSetupKeyword   contained define
syntax keyword formSetupKeyword   contained dotchar
syntax keyword formSetupKeyword   contained factorizationcache
syntax keyword formSetupKeyword   contained filepatches
syntax keyword formSetupKeyword   contained functionlevels
syntax keyword formSetupKeyword   contained hidesize
syntax keyword formSetupKeyword   contained incdir
syntax keyword formSetupKeyword   contained indentspace
syntax keyword formSetupKeyword   contained insidefirst
syntax keyword formSetupKeyword   contained jumpratio
syntax keyword formSetupKeyword   contained largepatches
syntax keyword formSetupKeyword   contained largesize
syntax keyword formSetupKeyword   contained maxnumbersize
syntax keyword formSetupKeyword   contained maxtermsize
syntax keyword formSetupKeyword   contained maxwildcards
syntax keyword formSetupKeyword   contained nospacesinnumbers
syntax keyword formSetupKeyword   contained numstorecaches
syntax keyword formSetupKeyword   contained nwritefinalstatistics
syntax keyword formSetupKeyword   contained nwriteprocessstatistics
syntax keyword formSetupKeyword   contained nwritestatistics
syntax keyword formSetupKeyword   contained nwritethreadstatistics
syntax keyword formSetupKeyword   contained oldfactarg
syntax keyword formSetupKeyword   contained oldgcd
syntax keyword formSetupKeyword   contained oldorder
syntax keyword formSetupKeyword   contained oldparallelstatistics
syntax keyword formSetupKeyword   contained parentheses
syntax keyword formSetupKeyword   contained path
syntax keyword formSetupKeyword   contained procedureextension
syntax keyword formSetupKeyword   contained processbucketsize
syntax keyword formSetupKeyword   contained resettimeonclear
syntax keyword formSetupKeyword   contained scratchsize
syntax keyword formSetupKeyword   contained shmwinsize
syntax keyword formSetupKeyword   contained sizestorecache
syntax keyword formSetupKeyword   contained smallextension
syntax keyword formSetupKeyword   contained smallsize
syntax keyword formSetupKeyword   contained sortiosize
syntax keyword formSetupKeyword   contained sorttype
syntax keyword formSetupKeyword   contained spectatorsize
syntax keyword formSetupKeyword   contained subfilepatches
syntax keyword formSetupKeyword   contained sublargepatches
syntax keyword formSetupKeyword   contained sublargesize
syntax keyword formSetupKeyword   contained subsmallextension
syntax keyword formSetupKeyword   contained subsmallsize
syntax keyword formSetupKeyword   contained subsortiosize
syntax keyword formSetupKeyword   contained subtermsinsmall
syntax keyword formSetupKeyword   contained tempdir
syntax keyword formSetupKeyword   contained tempsortdir
syntax keyword formSetupKeyword   contained termsinsmall
syntax keyword formSetupKeyword   contained threadbucketsize
syntax keyword formSetupKeyword   contained threadloadbalancing
syntax keyword formSetupKeyword   contained threads
syntax keyword formSetupKeyword   contained threadscratchoutsize
syntax keyword formSetupKeyword   contained threadscratchsize
syntax keyword formSetupKeyword   contained threadsortfilesynch
syntax keyword formSetupKeyword   contained totalsize
syntax keyword formSetupKeyword   contained workspace
syntax keyword formSetupKeyword   contained wtimestats

syntax keyword formOutputControl  contained abracket antibracket abrackets antibrackets
syntax keyword formExecutable     contained al also
syntax keyword formExecutable     contained antiputinside antiputin aputinside aputin
syntax keyword formExecutable     contained antisymmetrize
syntax keyword formTableBase      contained apply
syntax keyword formExecutable     contained argexplode
syntax keyword formExecutable     contained argimplode
syntax keyword formExecutable     contained argtoextrasymbol
syntax keyword formExecutable     contained argument
syntax keyword formDeclaration    contained auto autodeclare skipwhite nextgroup=formDeclaration
syntax keyword formOutputControl  contained bracket brackets
syntax keyword formConditional    contained break
syntax keyword formConditional    contained case
syntax keyword formDeclaration    contained cfunction cfunctions
syntax keyword formExecutable     contained chainin
syntax keyword formExecutable     contained chainout
syntax keyword formExecutable     contained chisholm
syntax keyword formDeclaration    contained cleartable
syntax keyword formSpecification  contained collect
syntax keyword formDeclaration    contained commuting
syntax keyword formDeclaration    contained commuteinset
syntax keyword formDeclaration    contained compress
syntax keyword formExecutable     contained contract
syntax keyword formDefinition     contained copyspectator
syntax keyword formDeclaration    contained createspectator
syntax keyword formDeclaration    contained ctable
syntax keyword formDeclaration    contained ctensor ctensors
syntax keyword formExecutable     contained cyclesymmetrize
syntax keyword formDeclaration    contained deallocatetable
syntax keyword formConditional    contained default
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
syntax keyword formConditional    contained elseif skipwhite nextgroup=formIfCondition
syntax keyword formSpecification  contained emptyspectator
syntax keyword formExecutable     contained endargument
syntax keyword formRepeat         contained enddo
syntax keyword formConditional    contained endif
syntax keyword formExecutable     contained endinexpression
syntax keyword formExecutable     contained endinside
syntax keyword formDeclaration    contained endmodel
syntax keyword formRepeat         contained endrepeat
syntax keyword formConditional    contained endswitch
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
syntax keyword formDeclaration    contained function functions
syntax keyword formDeclaration    contained funpowers
syntax keyword formDefinition     contained gfactorized globalfactor globalfactorized
syntax keyword formDefinition     contained global
syntax keyword formExecutable     contained goto
syntax keyword formSpecification  contained hide
syntax keyword formExecutable     contained id identify
syntax keyword formExecutable     contained idnew
syntax keyword formExecutable     contained idold
syntax keyword formConditional    contained if skipwhite nextgroup=formIfCondition
syntax region  formIfCondition    contained start=/(/ end=/)/ contains=formIfCondition,formIfFunction,formString,formNestedString,formFormalName,formNumber,formWildcard,formDollar skipwhite nextgroup=formExecutable
syntax keyword formExecutable     contained ifmatch
syntax keyword formExecutable     contained ifnomatch
syntax keyword formDeclaration    contained index indices indexes
syntax keyword formExecutable     contained inexpression
syntax keyword formSpecification  contained inparallel
syntax keyword formExecutable     contained inside
syntax keyword formDeclaration    contained insidefirst
syntax keyword formSpecification  contained intohide
syntax match   formSpecification  contained "\<keep\s\+brackets\>"
syntax keyword formLabel          contained label
syntax keyword formDefinition     contained lfactorized localfactor localfactorized
syntax keyword formDeclaration    contained load
syntax keyword formDefinition     contained local
syntax keyword formExecutable     contained makeinteger
syntax keyword formExecutable     contained many
syntax keyword formExecutable     contained merge
syntax keyword formDeclaration    contained metric
syntax keyword formDeclaration    contained model
syntax keyword formModuleControl  contained moduleoption
syntax keyword formDeclaration    contained modulus
syntax keyword formExecutable     contained multi
syntax keyword formExecutable     contained multiply
syntax keyword formSpecification  contained ndrop
syntax keyword formOutputControl  contained nfactorize
syntax keyword formDeclaration    contained nfunction nfunctions
syntax keyword formSpecification  contained nhide
syntax keyword formExecutable     contained normalize
syntax keyword formSpecification  contained notinparallel
syntax keyword formOutputControl  contained nprint
syntax keyword formSpecification  contained nskip
syntax keyword formDeclaration    contained ntable
syntax keyword formDeclaration    contained ntensor ntensors
syntax keyword formOutputControl  contained nunfactorize
syntax keyword formSpecification  contained nunhide
syntax keyword formDeclaration    contained nwrite
syntax keyword formDeclaration    contained off
syntax keyword formDeclaration    contained on
syntax keyword formExecutable     contained once
syntax keyword formExecutable     contained only
syntax keyword formDeclaration    contained particle
syntax keyword formDeclaration    contained polyfun
syntax keyword formDeclaration    contained polyratfun
syntax keyword formSpecification  contained pophide
syntax match   formMixedStatement contained "\<print\>\(\[\]\)\?"
syntax keyword formMixedStatement contained printtable
syntax keyword formDeclaration    contained processbucketsize
syntax keyword formDeclaration    contained propercount
syntax keyword formSpecification  contained pushhide
syntax keyword formExecutable     contained putinside putin
syntax keyword formExecutable     contained ratio
syntax keyword formExecutable     contained rcyclesymmetrize
syntax keyword formExecutable     contained redefine
syntax keyword formSpecification  contained removespectator
syntax keyword formExecutable     contained renumber
syntax keyword formRepeat         contained repeat skipwhite nextgroup=formExecutable
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
syntax keyword formConditional    contained switch
syntax keyword formDeclaration    contained symbol symbols
syntax keyword formExecutable     contained symmetrize
syntax keyword formDeclaration    contained table
syntax keyword formTableBase      contained tablebase
syntax keyword formDeclaration    contained tensor tensors
syntax keyword formExecutable     contained term
syntax keyword formTableBase      contained testuse
syntax keyword formDeclaration    contained threadbucketsize
syntax keyword formExecutable     contained topolynomial
syntax keyword formExecutable     contained tospectator
syntax keyword formExecutable     contained totensor
syntax keyword formExecutable     contained tovector
syntax keyword formExecutable     contained trace4
syntax keyword formExecutable     contained tracen
syntax keyword formExecutable     contained transform
syntax keyword formExecutable     contained tryreplace
syntax keyword formOutputControl  contained unfactorize
syntax keyword formSpecification  contained unhide
syntax keyword formDeclaration    contained unittrace
syntax keyword formDeclaration    contained vector vectors
syntax keyword formDeclaration    contained vertex
syntax keyword formRepeat         contained while skipwhite nextgroup=formIfCondition
syntax keyword formDeclaration    contained write

" Common abbreviations
syntax case match

syntax keyword formOutputControl  contained AB
syntax keyword formOutputControl  contained B
syntax keyword formDeclaration    contained CF
syntax keyword formDeclaration    contained CT
syntax keyword formDeclaration    contained F
syntax keyword formDefinition     contained G
syntax keyword formDefinition     contained GF
syntax keyword formDeclaration    contained I
syntax keyword formDefinition     contained LF
syntax keyword formDefinition     contained L
syntax keyword formDeclaration    contained NF
syntax keyword formDeclaration    contained NT
syntax keyword formMixedStatement contained P
syntax keyword formDeclaration    contained S
syntax keyword formDeclaration    contained T
syntax keyword formDeclaration    contained V

syntax case ignore

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
syntax keyword formFunction       id_
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
syntax keyword formFunction       mul_
syntax keyword formFunction       moebius_
syntax keyword formFunction       nargs_
syntax keyword formFunction       nterms_
syntax keyword formFunction       numfactors_
syntax keyword formFunction       partitions_
syntax keyword formFunction       pattern_
syntax keyword formFunction       perm_
syntax keyword formFunction       poly_
syntax keyword formFunction       prime_
syntax keyword formFunction       putfirst_
syntax keyword formFunction       random_
syntax keyword formFunction       ranperm_
syntax keyword formFunction       rem_
syntax keyword formFunction       replace_
syntax keyword formFunction       reverse_
syntax keyword formFunction       root_
syntax keyword formFunction       setfun_
syntax keyword formFunction       sig_
syntax keyword formFunction       sign_
syntax keyword formFunction       sizeof_
syntax keyword formFunction       sum_
syntax keyword formFunction       sump_
syntax keyword formFunction       table_
syntax keyword formFunction       tbl_
syntax keyword formFunction       term_
syntax keyword formFunction       termsin_
syntax keyword formFunction       termsinbracket_
syntax keyword formFunction       theta_
syntax keyword formFunction       thetap_
syntax keyword formFunction       topologies_

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
syntax keyword formSet            vector_

syntax keyword formIfFunction     contained count
syntax keyword formIfFunction     contained match
syntax keyword formIfFunction     contained expression
syntax keyword formIfFunction     contained occurs
syntax keyword formIfFunction     contained findloop
syntax keyword formIfFunction     contained multipleof
syntax keyword formIfFunction     contained coefficient

exec "syntax sync minlines=" . g:form_minlines

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
  HiLink formIfFunction         Function
  HiLink formSet                Number

  HiLink formComment            Comment
  HiLink formTodo               Todo
  HiLink formPreProc            PreProc
  HiLink formPreProcHead        PreProc
  HiLink formPreProcCommand     PreProc
  HiLink formPreProcBody        PreProc
  HiLink formPreProcString      PreProc
  HiLink formSetupHead          PreProc
  HiLink formSetupKeyword       PreProc
  HiLink formSetupBody          PreProc
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
