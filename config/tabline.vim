" Modifiers
"
"   :p    expand to full path
"   :f    expand to relative path to current cwd
"   :h    head (last path component removed)
"   :t    tail (last path component only)
"   :r    root (one extension removed)
"   :e    extension only

function! MyTabLine()
  let result = ''

  for index in range(tabpagenr('$'))
    let tabNr          = index + 1
    let activeWindowNr = tabpagewinnr(tabNr)
    "let numOfWindows   = tabpagewinnr(tabNr, '$')
    let buffers        = tabpagebuflist(tabNr)
    let bufferNr       = buffers[activeWindowNr - 1]
    let bufferName     = bufname(bufferNr)
    "let fileName       = fnamemodify(bufferName, ':t')
    "let isActice       = tabNr == tabpagenr()

    let result .= '%' . tabNr . 'T'
    let result .= (tabNr == tabpagenr() ? '%#TabLineSel#' : '%#TabLineFill#')
    let result .= ' ' . tabNr . ' '
    "let result .=  '(' . activeWindowNr . ':' . numOfWindows . ') '
    "let result .= (numOfWindows > 1 ? '(' . activeWindowNr . ':' . numOfWindows . ') '  : '')

    let result .= (tabNr == tabpagenr() ? '%#Visual#' : '%#LineNr#')
    let result .= (bufferName != '' ? ' ' . bufferName . ' ' : ' [No Name] ')

    if getbufvar(bufferNr, "&mod")
      let result .= '[+] '
    endif
  endfor

  let result .= '%#TabLineFill#'
  "let result .= '%=%999XX'

  return result
endfunction

set tabline=%!MyTabLine()
