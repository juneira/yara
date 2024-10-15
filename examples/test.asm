org 8000h
ld a, 25h
ld b, 25h
ld c, 25h
ld d, 25h
ld e, 25h
ld a, b
ld b, c
ld d, a
rlc b
set 7,a
set 6,(hl)
res 0,(hl)
in b,(c)
rrd
ld sp,(0afffh)
ld de,(0afffh)
im 2
