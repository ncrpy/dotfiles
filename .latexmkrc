#!/usr/bin/perl

# %O option
# %s source
# %D output
# %B base name

$latex = 'uplatex %O -synctex=1 -halt-on-error -interaction=nonstopmode %S';
$lualatex = 'lualatex %O -synctex=1 -halt-on-error -interaction=nonstopmode %S';
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex = 'upbibtex %O %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'upmendex %O -o %D %S';
$max_repeat = 10;
$pdf_mode = 4;

$pvc_view_file_via_temporary = 0;
$pdf_previewer = 'evince';
