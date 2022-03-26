#!/usr/bin/awk


NR == target {
    "date \"+%d %B %Y\"" | getline d
    "date \"+%H:%M\"" | getline t
    doneString = sprintf("x%s [%s \(%s\)]", $0, d, t)

    doneFile = FILENAME ".done"
    cmd = sprintf("echo \"%s\" >> %s", doneString, doneFile)
    system(cmd)
   }

NR != target {
   print $0
   }
