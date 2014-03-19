"=============================================================================
" $Id: c-fold.vim 567 2012-04-11 17:40:30Z luc.hermitte@gmail.com $
" File:		fold/c-fold.vim                                           {{{1
" Author:	Luc Hermitte <EMAIL:hermitte {at} free {dot} fr>
" 		<URL:http://code.google.com/p/lh-vim/>
" License:      GPLv3 with exceptions
"               <URL:http://code.google.com/p/lh-vim/wiki/License>
" Version:	2.0.0
" Created:	06th Jan 2005
" Last Update:	$Date: 2012-04-11 19:40:30 +0200 (Wed, 11 Apr 2012) $
"------------------------------------------------------------------------
" Description:
"       Simplified version of c-fold in order to speed-up the computations.
"       => we fold on indent.
"------------------------------------------------------------------------
" }}}1
"=============================================================================

"------------------------------------------------------------------------

setlocal foldmethod=indent

"=============================================================================
" vim600: set fdm=marker:
