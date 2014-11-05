" File:       dracula.vim
" Maintainer: Crusoe Xia (crusoexia)
" URL:        https://github.com/crusoexia/vim-dracula
" License:    MIT

" Initialisation
" --------------

if !has("gui_running") && &t_Co < 256
  finish
endif

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "dracula"

" Palettes
" --------

if has("gui_running")
  let s:vmode      = "gui"
  let s:background = "#282A36"
  let s:foreground = "#F2F2EC"
  let s:window     = "#424360"
  let s:line       = "#44475A"
  let s:darkcolumn = "#2D2F3B"
  let s:selection  = "#54576A"
  let s:comment    = "#6272A4"
  let s:error      = "#5F0000"
  
  let s:pink       = "#FF79C6"
  let s:green      = "#50FA7B"
  let s:aqua       = "#8BE9FD"
  let s:yellow     = "#F1FA8C"
  let s:orange     = "#FFB86C"
  let s:purple     = "#BD93F9"
  let s:red        = "#FF5555"

  let s:addfg      = "#F8F8F2"
  let s:addbg      = "#468410"
  let s:delfg      = "#8B080B"
  let s:changefg   = "#F8F8F2"
  let s:changebg   = "#243A5F"
else
  let s:vmode      = "cterm"
  let s:background = "235"
  let s:foreground = "231"
  let s:window     = "60"
  let s:line       = "237"
  let s:darkcolumn = "234"
  let s:selection  = "238"
  let s:comment    = "61"
  let s:error      = "52"
  
  let s:pink       = "212"
  let s:green      = "84"
  let s:aqua       = "117"
  let s:yellow     = "228"
  let s:orange     = "215"
  let s:purple     = "141"
  let s:red        = "231"

  let s:addfg      = "231"
  let s:addbg      = "64"
  let s:delfg      = "88"
  let s:changefg   = "231"
  let s:changebg   = "23"
endif

" Formatting Options
" ------------------

let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

" Highlighting Primitives
" -----------------------

exe "let s:bg_none       = ' ".s:vmode."bg=".s:none      ."'"
exe "let s:bg_foreground = ' ".s:vmode."bg=".s:foreground."'"
exe "let s:bg_background = ' ".s:vmode."bg=".s:background."'"
exe "let s:bg_selection  = ' ".s:vmode."bg=".s:selection ."'"
exe "let s:bg_line       = ' ".s:vmode."bg=".s:line      ."'"
exe "let s:bg_comment    = ' ".s:vmode."bg=".s:comment   ."'"
exe "let s:bg_red        = ' ".s:vmode."bg=".s:red       ."'"
exe "let s:bg_orange     = ' ".s:vmode."bg=".s:orange    ."'"
exe "let s:bg_yellow     = ' ".s:vmode."bg=".s:yellow    ."'"
exe "let s:bg_green      = ' ".s:vmode."bg=".s:green     ."'"
exe "let s:bg_aqua       = ' ".s:vmode."bg=".s:aqua      ."'"
exe "let s:bg_purple     = ' ".s:vmode."bg=".s:purple    ."'"
exe "let s:bg_pink       = ' ".s:vmode."bg=".s:pink      ."'"
exe "let s:bg_window     = ' ".s:vmode."bg=".s:window    ."'"
exe "let s:bg_darkcolumn = ' ".s:vmode."bg=".s:darkcolumn."'"
exe "let s:bg_addbg      = ' ".s:vmode."bg=".s:addbg     ."'"
exe "let s:bg_addfg      = ' ".s:vmode."bg=".s:addfg     ."'"
exe "let s:bg_changebg   = ' ".s:vmode."bg=".s:changebg  ."'"
exe "let s:bg_changefg   = ' ".s:vmode."bg=".s:changefg  ."'"
exe "let s:bg_error      = ' ".s:vmode."bg=".s:error     ."'"

exe "let s:fg_none       = ' ".s:vmode."fg=".s:none      ."'"
exe "let s:fg_foreground = ' ".s:vmode."fg=".s:foreground."'"
exe "let s:fg_background = ' ".s:vmode."fg=".s:background."'"
exe "let s:fg_selection  = ' ".s:vmode."fg=".s:selection ."'"
exe "let s:fg_line       = ' ".s:vmode."fg=".s:line      ."'"
exe "let s:fg_comment    = ' ".s:vmode."fg=".s:comment   ."'"
exe "let s:fg_red        = ' ".s:vmode."fg=".s:red       ."'"
exe "let s:fg_orange     = ' ".s:vmode."fg=".s:orange    ."'"
exe "let s:fg_yellow     = ' ".s:vmode."fg=".s:yellow    ."'"
exe "let s:fg_green      = ' ".s:vmode."fg=".s:green     ."'"
exe "let s:fg_aqua       = ' ".s:vmode."fg=".s:aqua      ."'"
exe "let s:fg_purple     = ' ".s:vmode."fg=".s:purple    ."'"
exe "let s:fg_pink       = ' ".s:vmode."fg=".s:pink      ."'"
exe "let s:fg_window     = ' ".s:vmode."fg=".s:window    ."'"
exe "let s:fg_darkcolumn = ' ".s:vmode."fg=".s:darkcolumn."'"
exe "let s:fg_addbg      = ' ".s:vmode."fg=".s:addbg     ."'"
exe "let s:fg_addfg      = ' ".s:vmode."fg=".s:addfg     ."'"
exe "let s:fg_delfg      = ' ".s:vmode."fg=".s:delfg     ."'"
exe "let s:fg_changebg   = ' ".s:vmode."fg=".s:changebg  ."'"
exe "let s:fg_changefg   = ' ".s:vmode."fg=".s:changefg  ."'"
exe "let s:fg_error      = ' ".s:vmode."fg=".s:error     ."'"

exe "let s:fmt_none      = ' ".s:vmode."=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi      = ' ".s:vmode."=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb      = ' ".s:vmode."=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi      = ' ".s:vmode."=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl      = ' ".s:vmode."=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital      = ' ".s:vmode."=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd      = ' ".s:vmode."=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr      = ' ".s:vmode."=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb      = ' ".s:vmode."=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

" Highlighting 
" ----------------

" editor
exe "hi! Normal"          .s:fg_foreground  .s:bg_background  .s:fmt_none
exe "hi! ColorColumn"     .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorColumn"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"      .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLineNr"    .s:fg_yellow      .s:bg_none        .s:fmt_bold
exe "hi! VertSplit"       .s:fg_window      .s:bg_window      .s:fmt_none
exe "hi! NonText"         .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SignColumn"      .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
exe "hi! LineNr"          .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! StatusLine"      .s:fg_comment     .s:bg_background  .s:fmt_revr
exe "hi! StatusLineNC"    .s:fg_window      .s:bg_comment     .s:fmt_revr
exe "hi! TabLine"         .s:fg_foreground  .s:bg_darkcolumn  .s:fmt_revr
exe "hi! Visual"          .s:fg_none        .s:bg_selection   .s:fmt_none
exe "hi! Search"          .s:fg_background  .s:bg_yellow      .s:fmt_none
exe "hi! MatchParen"      .s:fg_background  .s:bg_aqua        .s:fmt_none
exe "hi! Question"        .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! ModeMsg"         .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"         .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! ErrorMsg"        .s:fg_background  .s:bg_red         .s:fmt_stnd
exe "hi! WarningMsg"      .s:fg_red         .s:bg_none        .s:fmt_none

" misc
exe "hi! SpecialKey"      .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! Title"           .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! Directory"       .s:fg_aqua        .s:bg_none        .s:fmt_none

" diff
exe "hi! DiffAdd"         .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffDelete"      .s:fg_delfg       .s:bg_none        .s:fmt_none
exe "hi! DiffChange"      .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffText"        .s:fg_background  .s:bg_aqua        .s:fmt_none

" fold
exe "hi! Folded"          .s:fg_comment     .s:bg_darkcolumn  .s:fmt_none
exe "hi! FoldColumn"      .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
"        Incsearch"

" popup menu
exe "hi! Pmenu"           .s:fg_foreground  .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"        .s:fg_foreground  .s:bg_selection   .s:fmt_revr
"        PmenuSbar"
"        PmenuThumb"

" Generic Syntax Highlighting
" ---------------------------

exe "hi! Constant"        .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Number"          .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Float"           .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Boolean"         .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Character"       .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_yellow      .s:bg_none        .s:fmt_none

exe "hi! Identifier"      .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_green       .s:bg_none        .s:fmt_none

exe "hi! Type"            .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! Structure"       .s:fg_aqua        .s:bg_none        .s:fmt_none
"        StorageClass"
"        Typedef"

exe "hi! Statement"       .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! Operator"        .s:fg_pink        .s:bg_none        .s:fmt_none
exe "hi! Label"           .s:fg_yellow      .s:bg_none        .s:fmt_none
"        Conditional"
"        Repeat"
"        Keyword"
"        Exception"

exe "hi! PreProc"         .s:fg_aqua        .s:bg_none        .s:fmt_none
"        Include"
"        Define"
"        Macro"
"        PreCondit"

exe "hi! Special"         .s:fg_aqua        .s:bg_none        .s:fmt_none
"        SpecialKey
"        SpecialChar"
"        Tag"
"        Delimiter"
"        SpecialComment"
"        Debug"

exe "hi! Underlined"      .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Todo"            .s:fg_orange      .s:bg_none        .s:fmt_none
exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_none
exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none
exe "hi! Error"           .s:fg_red         .s:bg_error       .s:fmt_undr

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none

" Language highlight
" ------------------

" Vim command
exe "hi! vimCommand"                    .s:fg_pink         .s:bg_none          .s:fmt_none

" Javascript (compliant with https://github.com/pangloss/vim-javascript)
exe "hi! jsFunction"                    .s:fg_aqua         .s:bg_none          .s:fmt_none
exe "hi! jsFuncName"                    .s:fg_green        .s:bg_none          .s:fmt_none
exe "hi! jsFuncArgs"                    .s:fg_orange       .s:bg_none          .s:fmt_none
exe "hi! jsFuncCall"                    .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! jsThis"                        .s:fg_none         .s:bg_none          .s:fmt_none

" Html
exe "hi! htmlTag"                       .s:fg_foreground   .s:bg_none          .s:fmt_none
exe "hi! htmlEndTag"                    .s:fg_foreground   .s:bg_none          .s:fmt_none
exe "hi! htmlTagName"                   .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! htmlArg"                       .s:fg_aqua         .s:bg_none          .s:fmt_none
exe "hi! htmlSpecialChar"               .s:fg_purple       .s:bg_none          .s:fmt_none

" Xml
hi! link xmlTag     htmlTag
hi! link xmlEndTag  htmlEndTag
hi! link xmlTagName htmlTagName
hi! link xmlAttrib  htmlArg

" CSS
exe "hi! cssURL"                        .s:fg_orange       .s:bg_none          .s:fmt_ital
exe "hi! cssFunctionName"               .s:fg_aqua         .s:bg_none          .s:fmt_none
exe "hi! cssColor"                      .s:fg_purple       .s:bg_none          .s:fmt_none
exe "hi! cssPseudoClassId"              .s:fg_purple       .s:bg_none          .s:fmt_none
exe "hi! cssClassName"                  .s:fg_green        .s:bg_none          .s:fmt_none
exe "hi! cssValueLength"                .s:fg_purple       .s:bg_none          .s:fmt_none
exe "hi! cssCommonAttr"                 .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! cssBraces"                     .s:fg_none         .s:bg_none          .s:fmt_none

" ruby
exe "hi! rubyClass"                     .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! rubyFunction"                  .s:fg_green        .s:bg_none          .s:fmt_none
exe "hi! rubyInterpolationDelimiter"    .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! rubySymbol"                    .s:fg_purple       .s:bg_none          .s:fmt_none
exe "hi! rubyStringDelimiter"           .s:fg_yellow       .s:bg_none          .s:fmt_none
exe "hi! rubyBlockParameter"            .s:fg_orange       .s:bg_none          .s:fmt_none
exe "hi! rubyInstanceVariable"          .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! rubyInclude"                   .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! rubyGlobalVariable"            .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! rubyRegexp"                    .s:fg_yellow       .s:bg_none          .s:fmt_none
exe "hi! rubyRegexpDelimiter"           .s:fg_yellow       .s:bg_none          .s:fmt_none
exe "hi! rubyEscape"                    .s:fg_purple       .s:bg_none          .s:fmt_none
exe "hi! rubyControl"                   .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! rubyClassVariable"             .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! rubyOperator"                  .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! rubyException"                 .s:fg_pink         .s:bg_none          .s:fmt_none
exe "hi! rubyPseudoVariable"            .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! rubyRailsARAssociationMethod"  .s:fg_aqua         .s:bg_none          .s:fmt_none
exe "hi! rubyRailsARMethod"             .s:fg_aqua         .s:bg_none          .s:fmt_none
exe "hi! rubyRailsRenderMethod"         .s:fg_aqua         .s:bg_none          .s:fmt_none
exe "hi! rubyRailsMethod"               .s:fg_aqua         .s:bg_none          .s:fmt_none

" eruby
exe "hi! erubyDelimiter"                .s:fg_none         .s:bg_none          .s:fmt_none
exe "hi! erubyComment"                  .s:fg_comment      .s:bg_none          .s:fmt_none
exe "hi! erubyRailsMethod"              .s:fg_aqua         .s:bg_none          .s:fmt_none
