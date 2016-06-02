" Vim color file
" Converted from Textmate theme Railscasts using Coloration v0.3.2 (http://github.com/sickill/coloration)
" and edited manually

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "xndd"

hi Cursor                       ctermfg=NONE  ctermbg=15    cterm=NONE
hi Visual                       ctermfg=NONE  ctermbg=59    cterm=NONE
hi CursorLine                   ctermfg=NONE  ctermbg=234   cterm=NONE
hi CursorColumn                 ctermfg=NONE  ctermbg=234   cterm=NONE
hi ColorColumn                  ctermfg=NONE  ctermbg=233   cterm=NONE
"hi LineNr                       ctermfg=102   ctermbg=237   cterm=NONE
hi LineNr                       ctermfg=8     ctermbg=235     cterm=NONE
hi VertSplit                    ctermfg=241   ctermbg=241   cterm=NONE
hi MatchParen                   ctermfg=173   ctermbg=NONE  cterm=NONE
hi StatusLine                   ctermfg=188   ctermbg=235   cterm=bold
hi StatusLineNC                 ctermfg=188   ctermbg=241   cterm=NONE
hi Pmenu                        ctermfg=15    ctermbg=NONE  cterm=NONE
hi PmenuSel                     ctermfg=NONE  ctermbg=59    cterm=NONE
hi IncSearch                    ctermfg=NONE  ctermbg=58    cterm=NONE
hi Search                       ctermfg=NONE  ctermbg=58    cterm=NONE
hi Directory                    ctermfg=73    ctermbg=NONE  cterm=NONE
hi Folded                       ctermfg=137   ctermbg=235   cterm=NONE

"hi Normal                       ctermfg=188   ctermbg=235   cterm=NONE
hi Normal                       ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi Boolean                      ctermfg=73    ctermbg=NONE  cterm=NONE
hi Character                    ctermfg=73    ctermbg=NONE  cterm=NONE
hi Comment                      ctermfg=137   ctermbg=NONE  cterm=NONE
hi Conditional                  ctermfg=173   ctermbg=NONE  cterm=NONE
hi Constant                     ctermfg=73    ctermbg=NONE  cterm=NONE
hi Define                       ctermfg=173   ctermbg=NONE  cterm=NONE
hi ErrorMsg                     ctermfg=15    ctermbg=88    cterm=NONE
hi WarningMsg                   ctermfg=15    ctermbg=88    cterm=NONE
hi Float                        ctermfg=143   ctermbg=NONE  cterm=NONE
hi Function                     ctermfg=221   ctermbg=NONE  cterm=NONE
hi Identifier                   ctermfg=173   ctermbg=NONE  cterm=NONE
hi Keyword                      ctermfg=173   ctermbg=NONE  cterm=NONE
hi Label                        ctermfg=143   ctermbg=NONE  cterm=NONE
"hi NonText                      ctermfg=238   ctermbg=236   cterm=NONE
hi NonText                      ctermfg=0     ctermbg=NONE  cterm=NONE
hi Number                       ctermfg=143   ctermbg=NONE  cterm=NONE
hi Operator                     ctermfg=173   ctermbg=NONE  cterm=NONE
hi PreProc                      ctermfg=173   ctermbg=NONE  cterm=NONE
hi Special                      ctermfg=188   ctermbg=NONE  cterm=NONE
hi SpecialKey                   ctermfg=238   ctermbg=237   cterm=NONE
"hi SpecialKey                   ctermfg=0     ctermbg=NONE  cterm=NONE
hi Statement                    ctermfg=173   ctermbg=NONE  cterm=NONE
hi StorageClass                 ctermfg=173   ctermbg=NONE  cterm=NONE
hi String                       ctermfg=143   ctermbg=NONE  cterm=NONE
hi Tag                          ctermfg=179   ctermbg=NONE  cterm=NONE
hi Title                        ctermfg=4     ctermbg=NONE  cterm=bold
hi Todo                         ctermfg=137   ctermbg=NONE  cterm=inverse,bold
hi Type                         ctermfg=15    ctermbg=NONE  cterm=NONE
hi Underlined                   ctermfg=NONE  ctermbg=NONE  cterm=underline

" Ruby
hi rubyClass                    ctermfg=173   ctermbg=NONE  cterm=NONE
hi rubyFunction                 ctermfg=221   ctermbg=NONE  cterm=NONE
hi rubyInterpolationDelimiter   ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi rubySymbol                   ctermfg=4     ctermbg=NONE  cterm=NONE
hi rubyConstant                 ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi rubyStringDelimiter          ctermfg=143   ctermbg=NONE  cterm=NONE
hi rubyBlockParameter           ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi rubyInstanceVariable         ctermfg=189   ctermbg=NONE  cterm=NONE
hi rubyInclude                  ctermfg=173   ctermbg=NONE  cterm=NONE
hi rubyGlobalVariable           ctermfg=189   ctermbg=NONE  cterm=NONE
hi rubyRegexp                   ctermfg=143   ctermbg=NONE  cterm=NONE
hi rubyRegexpDelimiter          ctermfg=143   ctermbg=NONE  cterm=NONE
hi rubyEscape                   ctermfg=71    ctermbg=NONE  cterm=NONE
hi rubyControl                  ctermfg=173   ctermbg=NONE  cterm=NONE
hi rubyClassVariable            ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi rubyOperator                 ctermfg=173   ctermbg=NONE  cterm=NONE
hi rubyException                ctermfg=173   ctermbg=NONE  cterm=NONE
hi rubyPseudoVariable           ctermfg=189   ctermbg=NONE  cterm=NONE
hi rubyRailsUserClass           ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi rubyRailsARAssociationMethod ctermfg=167   ctermbg=NONE  cterm=NONE
hi rubyRailsARMethod            ctermfg=167   ctermbg=NONE  cterm=NONE
hi rubyRailsRenderMethod        ctermfg=167   ctermbg=NONE  cterm=NONE
hi rubyRailsMethod              ctermfg=167   ctermbg=NONE  cterm=NONE

" eruby
hi erubyDelimiter               ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi erubyComment                 ctermfg=137   ctermbg=NONE  cterm=NONE
hi erubyRailsMethod             ctermfg=167   ctermbg=NONE  cterm=NONE

" HTML
hi htmlTag                      ctermfg=179   ctermbg=NONE  cterm=NONE
hi htmlEndTag                   ctermfg=179   ctermbg=NONE  cterm=NONE
hi htmlTagName                  ctermfg=179   ctermbg=NONE  cterm=NONE
hi htmlArg                      ctermfg=179   ctermbg=NONE  cterm=NONE
hi htmlSpecialChar              ctermfg=73    ctermbg=NONE  cterm=NONE

" JavaScript
hi javaScriptFunction           ctermfg=173   ctermbg=NONE  cterm=NONE
hi javaScriptRailsFunction      ctermfg=167   ctermbg=NONE  cterm=NONE
hi javaScriptBraces             ctermfg=NONE  ctermbg=NONE  cterm=NONE

" YAML
hi yamlKey                      ctermfg=179   ctermbg=NONE  cterm=NONE
hi yamlAnchor                   ctermfg=189   ctermbg=NONE  cterm=NONE
hi yamlAlias                    ctermfg=189   ctermbg=NONE  cterm=NONE
hi yamlDocumentHeader           ctermfg=143   ctermbg=NONE  cterm=NONE

" CSS
hi cssURL                       ctermfg=NONE  ctermbg=NONE  cterm=NONE
hi cssFunctionName              ctermfg=167   ctermbg=NONE  cterm=NONE
hi cssColor                     ctermfg=73    ctermbg=NONE  cterm=NONE
hi cssPseudoClassId             ctermfg=179   ctermbg=NONE  cterm=NONE
hi cssClassName                 ctermfg=179   ctermbg=NONE  cterm=NONE
hi cssValueLength               ctermfg=143   ctermbg=NONE  cterm=NONE
hi cssCommonAttr                ctermfg=143   ctermbg=NONE  cterm=NONE
hi cssBraces                    ctermfg=NONE  ctermbg=NONE  cterm=NONE

" Tpope's Markdown
hi markdownH1                   ctermfg=173   ctermbg=NONE  cterm=bold
hi markdownH2                   ctermfg=173   ctermbg=NONE  cterm=NONE
hi markdownH3                   ctermfg=173   ctermbg=NONE  cterm=NONE
hi markdownH4                   ctermfg=173   ctermbg=NONE  cterm=NONE
hi markdownH5                   ctermfg=173   ctermbg=NONE  cterm=NONE
hi markdownH6                   ctermfg=173   ctermbg=NONE  cterm=NONE
hi markdownHeadingRule          ctermfg=173   ctermbg=NONE  cterm=bold
hi markdownHeadingDelimiter     ctermfg=173   ctermbg=NONE  cterm=bold
hi markdownOrderedListMarker    ctermfg=221   ctermbg=NONE  cterm=bold
hi markdownListMarker           ctermfg=221   ctermbg=NONE  cterm=bold
hi markdownBlockquote           ctermfg=221   ctermbg=NONE  cterm=bold
hi markdownRule                 ctermfg=221   ctermbg=NONE  cterm=bold
hi markdownLinkText             ctermfg=4     ctermbg=NONE  cterm=NONE
hi markdownIdDeclaration        ctermfg=1     ctermbg=NONE  cterm=NONE
hi markdownId                   ctermfg=1     ctermbg=NONE  cterm=NONE
hi markdownAutomaticLink        ctermfg=3     ctermbg=NONE  cterm=NONE
hi markdownUrl                  ctermfg=3     ctermbg=NONE  cterm=NONE
hi markdownUrlTitle             ctermfg=1     ctermbg=NONE  cterm=NONE
hi markdownIdDelimiter          ctermfg=1     ctermbg=NONE  cterm=NONE
hi markdownUrlDelimiter         ctermfg=4     ctermbg=NONE  cterm=NONE
hi markdownUrlTitleDelimiter    ctermfg=1     ctermbg=NONE  cterm=NONE
hi markdownItalic               ctermfg=221   ctermbg=NONE  cterm=italic
hi markdownBold                 ctermfg=221   ctermbg=NONE  cterm=bold
hi markdownBoldItalic           ctermfg=221   ctermbg=NONE  cterm=bold,italic
hi markdownCodeDelimiter        ctermfg=1     ctermbg=NONE  cterm=bold
hi markdownEscape               ctermfg=212   ctermbg=NONE  cterm=NONE
hi markdownError                ctermfg=212   ctermbg=NONE  cterm=NONE
"hi markdownCode                 ctermfg=8     ctermbg=NONE  cterm=NONE
hi markdownCode                 ctermfg=143   ctermbg=NONE  cterm=NONE
"hi markdownCodeBlock            ctermfg=8     ctermbg=NONE  cterm=NONE
hi markdownCodeBlock            ctermfg=143   ctermbg=NONE  cterm=NONE

hi TabLine      ctermfg=250  ctermbg=235  cterm=none
hi TabLineFill  ctermfg=235  ctermbg=8    cterm=none
hi TabLineSel   ctermfg=255  ctermbg=28   cterm=none

hi DiffAdd      cterm=bold   ctermfg=10   ctermbg=17
hi DiffDelete   cterm=bold   ctermfg=10   ctermbg=17
hi DiffChange   cterm=bold   ctermfg=10   ctermbg=17
hi DiffText     cterm=bold   ctermfg=10   ctermbg=88

"" highlight trailing whitespace, tab characters, and text at column > 80
"hi XnddUtils                    ctermfg=NONE  ctermbg=8     cterm=NONE
"match XnddUtils /\s\+$\|\t\+\|\%>80v/
"" 	example of tab and trailing whitespaces     
"" example of line that exceed more that 80 column 1 2 3 4 5 6 7 8 9 0 11 12 13 14 15

