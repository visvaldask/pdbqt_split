#!/bin/csh -f
# script to split pdbqt files, e.g. coming out from the autodock program or its clones
#written by Visvaldas Kairys (Vilnius University)
foreach file ( $argv )
    set filebase=$file:r
    echo $filebase
    split -d -p 'MODEL' $file ${filebase}_
    foreach file1 ( ${filebase}_* )
        mv $file1 $file1.pdbqt
        sed -i.bak -e '/^MODEL/d' -e '/^ENDMDL/d' $file1.pdbqt
    end
end
