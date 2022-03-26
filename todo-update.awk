#!/usr/bin/awk

NR == target {
    print $1 " " description
   }

NR != target {
   print $0
   }

