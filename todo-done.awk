#!/usr/bin/awk

NR == target {
      doneString = sprintf("x%s", $0)
      doneFile = FILENAME ".done"
      cmd = sprintf("echo %s >> %s", doneString, doneFile)
      system(cmd)
   }

NR != target {
   print $0
   }
