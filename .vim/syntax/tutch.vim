" Vim syntax file
" Language:     Tutch
" Maintainer:   matthewj@andrew.cmu.edu
" Cribbed largely from c.vim.

if exists("b:current_syntax")
  finish
end

syn case match

syn match       tProp       "\<\u\(\w\)*\>"

syn keyword     tDecl       proof classical term annotated rec val
syn keyword     tKeyword    begin end
syn keyword     tOperator   let fn case fst snd
syn keyword     tConstructor inl inr
syn match       tOperator   ":"
syn match       tOperator   ";"
syn match       tConnective "!"
syn match       tConnective "?"
syn match       tConnective "=>"
syn match       tConnective "<=>"
syn match       tConnective "&"
syn match       tConnective "|"
syn match       tConnective "T"
syn match       tConnective "F"
syn match       tConnective "\~"
syn match       tBrackErr   "\]"
syn match       tParenErr   ")"
syn cluster     tErrs contains=tBrackErr,tParenErr

syn region tComment         start="%" end="$"
syn region tBlockComment    start="%{" end="}%" contains=tBlockComment
syn region tEncl transparent matchgroup=tDelim start="(" matchgroup=tDelim end=")" contains=ALLBUT,tParenErr
syn region tEncl transparent matchgroup=tDelim start="\[" matchgroup=tDelim end="\]" contains=ALLBUT,tBrackErr

hi def link tProp Constant
hi def link tDecl Statement
hi def link tOperator Operator
hi def link tConstructor Keyword
hi def link tComment Comment
hi def link tBlockComment Comment
hi def link tConnective Type
hi def link tKeyword Keyword
hi def link tBrackErr Error
hi def link tParenErr Error
hi def link tDelim Delimiter

let b:current_syntax = "tutch"
