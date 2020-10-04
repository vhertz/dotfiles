#!/usr/bin/env perl

if ($^O eq 'MSWin32') { # for Windows
    
    # set commands
    $latex     = 'uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode %S';
    $pdflatex  = 'pdflatex %O -synctex=1 -interaction=nonstopmode %S';
    $lualatex  = 'lualatex -cmdx %O -synctex=1 -interaction=nonstopmode %S';
    $xelatex   = 'xelatex %O -no-pdf -synctex=1 -shell-escape -interaction=nonstopmode %S';
    $biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
    $bibtex    = 'upbibtex %O %B';
    $makeindex = 'upmendex %O -o %D %S';
    $dvipdf    = 'dvipdfmx %O -o %D %S';
    $dvips     = 'dvips %O -z -f %S | convbkmk -u > %D';
    $ps2pdf    = 'ps2pdf.exe %O %S %D';
   
    # switch ($pdf_mode) {
    #   case 0: do NOT generate a pdf version of the document.
    #   case 1: generate a pdf version of the document using $pdflatex.
    #   case 2: generate a pdf version of the document using $ps2pdf.
    #   case 3: generate a pdf version of the document using $dvipdf.
    #   case 4: generate a pdf version of the document using $lualatex.
    #   case 5: generate a pdf version of the document using $xelatex.
    # }
    $pdf_mode   = 3;
    
    # WARNING:
    # Problem under MS-Windows: if acroread is used as the pdf previewer, and it
    # is actually viewing a pdf file, the pdf file cannot be updated. Thus makes
    # acroread a bad choice of previewer if you use latexmk’s
    # previous-continuous mode (option -pvc) under MS-windows. This problem does
    # not occur if, for example, SumatraPDF or gsview is used to view pdf files.
    if (-f 'C:/Program Files/SumatraPDF/SumatraPDF.exe') {
        $pdf_previewer = '"C:/Program Files/SumatraPDF/SumatraPDF.exe" -reuse-instance';
    } elsif (-f 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe') {
        $pdf_previewer = '"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe" -reuse-instance';
    } else {
        $pdf_previewer = 'texworks';
    }

} else { # for not Windows (macOS, Linux)
    
    # set commands
    $latex      = 'uplatex %O -synctex=1 -interaction=nonstopmode %S';
    $pdflatex   = 'pdflatex %O -synctex=1 -interaction=nonstopmode %S';
    $lualatex   = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
    $xelatex    = 'xelatex %O -no-pdf -synctex=1 -shell-escape -interaction=nonstopmode %S';
    $biber      = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
    $bibtex     = 'upbibtex %O %B';
    $makeindex  = 'upmendex %O -o %D %S';
    $dvipdf     = 'dvipdfmx %O -o %D %S';
    $dvips      = 'dvips %O -z -f %S | convbkmk -u > %D';
    $ps2pdf     = 'ps2pdf %O %S %D';
    
    $pdf_mode   = 3;

    if ($^O eq 'darwin') { # for macOS
        $pvc_view_file_via_temporary = 0;
        $pdf_previewer = '';
    } else { # for Linux
        $pdf_previewer = 'xdg-open';
    }

}
