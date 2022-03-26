#!/usr/bin/awk

NR == target {
    $1 = priority
    print $0
   }

NR != target {
   print $0
   }

