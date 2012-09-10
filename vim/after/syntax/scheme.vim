syn keyword schemeSyntax trace-define trace-define-who define-who trace-lambda
syn keyword schemeSyntax define-curried trace-define-curried
syn keyword schemeSyntax match trace-match -> let-values let*-values
syntax region schemeMultilineComment start=/#|/ end=/|#/ contains=schemeMultilineComment
