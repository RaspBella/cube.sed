#!/usr/bin/env -S sed -f

# internal representation (largely speffz + weird extra characters):
#     AaB
#     d!b
#     DcC
# EeF IiJ MmN QqR
# h@f l#j p$n t%r
# HgG LkK PoO TsS
#     UuV
#     x^v
#     XwW

# initial cube state
1 {
x
s/$/AaBd!bDcCEeFIiJMmNQqRh@fl#jp$nt%rHgGLkKPoOTsSUuVx^vXwW/
x
}



# convert   R F2 D' -> RFFDDD

s/ //g
s/\(.\)2/\1\1/g
s/\(.\)'/\1\1\1/g



:move

/^$/ b done




/^U/ {
x
#   A         B           D         C    D   A   C   B
s/\(.\)\(.\)\(.\)\(...\)\(.\)\(.\)\(.\)/\5\2\1\4\7\6\3/
#        a         d         b         c      d   c   a   b
s/\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)/\1\4\3\8\5\2\7\6/
#             E          I          M          Q      I   M   Q   E
s/\(.\{9\}\)\(.\)\(..\)\(.\)\(..\)\(.\)\(..\)\(.\)/\1\4\3\6\5\8\7\2/
#              e          i          m          q      i   m   q   e
s/\(.\{10\}\)\(.\)\(..\)\(.\)\(..\)\(.\)\(..\)\(.\)/\1\4\3\6\5\8\7\2/
#              F          J          N          R      J   N   R   F
s/\(.\{11\}\)\(.\)\(..\)\(.\)\(..\)\(.\)\(..\)\(.\)/\1\4\3\6\5\8\7\2/
b next
}


/^D/ {
x
#              U         V           X         W      X   U   W   V
s/\(.\{45\}\)\(.\)\(.\)\(.\)\(...\)\(.\)\(.\)\(.\)/\1\6\3\2\5\8\7\4/
#              u         x         v         w      x   w   u   v
s/\(.\{46\}\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)\(.\)/\1\4\3\8\5\2\7\6/
#              H          L          P          T      T   H   L   P
s/\(.\{33\}\)\(.\)\(..\)\(.\)\(..\)\(.\)\(..\)\(.\)/\1\8\3\2\5\4\7\6/
#              g          k          o          s      s   g   k   o
s/\(.\{34\}\)\(.\)\(..\)\(.\)\(..\)\(.\)\(..\)\(.\)/\1\8\3\2\5\4\7\6/
#              G          K          O          S      K   O   S   G
s/\(.\{35\}\)\(.\)\(..\)\(.\)\(..\)\(.\)\(..\)\(.\)/\1\8\3\2\5\4\7\6/
b next
}


/^R/ {
x
#         B               J               T            V      J   V   B   T
s/\(..\)\(.\)\(.\{11\}\)\(.\)\(.\{27\}\)\(.\)\(....\)\(.\)/\1\4\3\8\5\2\7\6/
#             b               j           t               v      j   v   t   b
s/\(.\{5\}\)\(.\)\(.\{20\}\)\(.\)\(...\)\(.\)\(.\{19\}\)\(.\)/\1\4\3\8\5\2\7\6/
#             C              Q               K               W      K   C   W   Q
s/\(.\{8\}\)\(.\)\(.\{9\}\)\(.\)\(.\{19\}\)\(.\)\(.\{14\}\)\(.\)/\1\6\3\2\5\8\7\4/
#              M         N               P         O      P   M   O   N
s/\(.\{15\}\)\(.\)\(.\)\(.\)\(.\{21\}\)\(.\)\(.\)\(.\)/\1\6\3\2\5\8\7\4/
#              m               p         n               o      p   o   m   n
s/\(.\{16\}\)\(.\)\(.\{10\}\)\(.\)\(.\)\(.\)\(.\{10\}\)\(.\)/\1\4\3\8\5\2\7\6/
b next
}


/^L/ {
x
#             E         F               H         G      H   E   G   F
s/\(.\{9\}\)\(.\)\(.\)\(.\)\(.\{21\}\)\(.\)\(.\)\(.\)/\1\6\3\2\5\8\7\4/
#              e               h         f               g      h   g   e   f
s/\(.\{10\}\)\(.\)\(.\{10\}\)\(.\)\(.\)\(.\)\(.\{10\}\)\(.\)/\1\4\3\8\5\2\7\6/
#   A               I               S    U    S   A   U I
s/\(.\)\(.\{11\}\)\(.\)\(.\{31\}\)\(.\)\(.\)/\5\2\1\4\6\3/
#             D               R               L               X      R   X   D   L
s/\(......\)\(.\)\(.\{13\}\)\(.\)\(.\{15\}\)\(.\)\(.\{14\}\)\(.\)/\1\4\3\8\5\2\7\6/
#          d               l             r               x      t   d   l   x
s/\(...\)\(.\)\(.\{20\}\)\(.\)\(.\{7\}\)\(.\)\(.\{15\}\)\(.\)/\1\6\3\2\5\8\7\4/
b next
}


/^F/ {
x
#              I         J               L         K      L   I   K   J
s/\(.\{12\}\)\(.\)\(.\)\(.\)\(.\{21\}\)\(.\)\(.\)\(.\)/\1\6\3\2\5\8\7\4/
#              i               l         j               k      l   k   i   j
s/\(.\{13\}\)\(.\)\(.\{10\}\)\(.\)\(.\)\(.\)\(.\{10\}\)\(.\)/\1\4\3\8\5\2\7\6/
#             D              M               G               V      G   D   V   M
s/\(.\{6\}\)\(.\)\(.\{8\}\)\(.\)\(.\{19\}\)\(.\)\(.\{11\}\)\(.\)/\1\6\3\2\5\8\7\4/
#             c               f           p               u      f   u   c   p
s/\(.\{7\}\)\(.\)\(.\{15\}\)\(.\)\(...\)\(.\)\(.\{18\}\)\(.\)/\1\4\3\8\5\2\7\6/
#             C          F               P             U      F   U   C   P
s/\(.\{8\}\)\(.\)\(..\)\(.\)\(.\{27\}\)\(.\)\(.....\)\(.\)/\1\4\3\8\5\2\7\6/
b next
}


/^B/ {
x
#              Q         R               T          S     T   Q   S   R
s/\(.\{18\}\)\(.\)\(.\)\(.\)\(.\{21\}\)\(.\)\(.\)\(.\)/\1\6\3\2\5\8\7\4/
#              q               t         r               s      t   s   q   r
s/\(.\{19\}\)\(.\)\(.\{10\}\)\(.\)\(.\)\(.\)\(.\{10\}\)\(.\)/\1\4\3\8\5\2\7\6/
#   A               N               H               W    N   W   A   H
s/\(.\)\(.\{16\}\)\(.\)\(.\{15\}\)\(.\)\(.\{19\}\)\(.\)/\3\2\7\4\1\6\5/
#        a               h              n               w      n   a   w   h
s/\(.\)\(.\)\(.\{19\}\)\(.\)\(.\{7\}\)\(.\)\(.\{22\}\)\(.\)/\1\6\3\2\5\8\7\4/
#         B              E               O              X      O   B   X   E
s/\(..\)\(.\)\(.\{6\}\)\(.\)\(.\{31\}\)\(.\)\(.\{9\}\)\(.\)/\1\6\3\2\5\8\7\4/
}

:next
x
s/.//
b move



:done

x
h



# display

s/\(...\)\(...\)\(...\)/      \1\n      \2\n      \3\n/
s/\(...\)\(...\)\(...\)$/\n      \1\n      \2\n      \3/
s/\n\(.\{12\}\)\(.\{12\}\)\(.\{12\}\)\n/\n\1\n\2\n\3\n/



# m first to avoid corrupting the escapes
s/[MNOPmnop$]/\x1b[48;5;196m  \x1b[m/g
s/[ABCDabcd!]/\x1b[48;5;231m  \x1b[m/g
s/[EFGHefgh@]/\x1b[48;5;202m  \x1b[m/g
s/[IJKLijkl#]/\x1b[48;5;34m  \x1b[m/g
s/[QRSTqrst%]/\x1b[48;5;21m  \x1b[m/g
s/[UVWXuvwx^]/\x1b[48;5;220m  \x1b[m/g
p

g
d
