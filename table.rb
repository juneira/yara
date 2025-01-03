require './opcode'
require './table/bit'
require './table/misc'
require './table/ix'
require './table/ixbit'
require './table/iy'
require './table/iybit'

class Table
  TABLE = [
    # 0x0N
    Opcode.new('nop'),
    Opcode.new('ld (bc),xx', step: 3),
    Opcode.new('ld (bc),a'),
    Opcode.new('inc bc'),
    Opcode.new('inc b'),
    Opcode.new('dec b'),
    Opcode.new('ld b,x', step: 2),
    Opcode.new('rlca'),
    Opcode.new('ex af, af\''),
    Opcode.new('add hl,bc'),
    Opcode.new('ld a,(bc)'),
    Opcode.new('dec bc'),
    Opcode.new('inc c'),
    Opcode.new('dec c'),
    Opcode.new('ld c,x', step: 2),
    Opcode.new('rrca'),

    # 0x1N
    Opcode.new('djnz x', step: 2),
    Opcode.new('ld de,xx', step: 3),
    Opcode.new('ld (de),a'),
    Opcode.new('inc de'),
    Opcode.new('inc d'),
    Opcode.new('dec d'),
    Opcode.new('ld d,x', step: 2),
    Opcode.new('rla'),
    Opcode.new('jr x', step: 2),
    Opcode.new('add hl,de'),
    Opcode.new('ld a,(de)'),
    Opcode.new('dec de'),
    Opcode.new('inc e'),
    Opcode.new('dec e'),
    Opcode.new('ld e,x', step: 2),
    Opcode.new('rra'),

    # 0x2N
    Opcode.new('jr nz,x', step: 2),
    Opcode.new('ld hl,xx', step: 3),
    Opcode.new('ld (xx),hl', step: 3),
    Opcode.new('inc hl'),
    Opcode.new('inc h'),
    Opcode.new('dec h'),
    Opcode.new('ld h,x', step: 2),
    Opcode.new('daa'),
    Opcode.new('jr z,x', step: 2),
    Opcode.new('add hl,hl'),
    Opcode.new('ld hl,(xx)', step: 3),
    Opcode.new('dec hl'),
    Opcode.new('inc l'),
    Opcode.new('dec l'),
    Opcode.new('ld l,x', step: 2),
    Opcode.new('cpl'),

    # 0x3N
    Opcode.new('jr nc,x', step: 2),
    Opcode.new('ld sp,xx', step: 3),
    Opcode.new('ld (xx),a', step: 3),
    Opcode.new('inc sp'),
    Opcode.new('inc (hl)'),
    Opcode.new('dec (hl)'),
    Opcode.new('ld (hl),x', step: 2),
    Opcode.new('scf'),
    Opcode.new('jr c,x', step: 2),
    Opcode.new('add hl,sp'),
    Opcode.new('ld a,(xx)', step: 3),
    Opcode.new('dec sp'),
    Opcode.new('inc a'),
    Opcode.new('dec a'),
    Opcode.new('ld a,x', step: 2),
    Opcode.new('ccf'),

    # 0x4N
    Opcode.new('ld b,b'),
    Opcode.new('ld b,c'),
    Opcode.new('ld b,d'),
    Opcode.new('ld b,e'),
    Opcode.new('ld b,h'),
    Opcode.new('ld b,l'),
    Opcode.new('ld b,(hl)'),
    Opcode.new('ld b,a'),
    Opcode.new('ld c,b'),
    Opcode.new('ld c,c'),
    Opcode.new('ld c,d'),
    Opcode.new('ld c,e'),
    Opcode.new('ld c,h'),
    Opcode.new('ld c,l'),
    Opcode.new('ld c,(hl)'),
    Opcode.new('ld c,a'),

    # 0x5N
    Opcode.new('ld d,b'),
    Opcode.new('ld d,c'),
    Opcode.new('ld d,d'),
    Opcode.new('ld d,e'),
    Opcode.new('ld d,h'),
    Opcode.new('ld d,l'),
    Opcode.new('ld d,(hl)'),
    Opcode.new('ld d,a'),
    Opcode.new('ld e,b'),
    Opcode.new('ld e,c'),
    Opcode.new('ld e,d'),
    Opcode.new('ld e,e'),
    Opcode.new('ld e,h'),
    Opcode.new('ld e,l'),
    Opcode.new('ld e,(hl)'),
    Opcode.new('ld e,a'),

    # 0x6N
    Opcode.new('ld h,b'),
    Opcode.new('ld h,c'),
    Opcode.new('ld h,d'),
    Opcode.new('ld h,e'),
    Opcode.new('ld h,h'),
    Opcode.new('ld h,l'),
    Opcode.new('ld h,(hl)'),
    Opcode.new('ld h,a'),
    Opcode.new('ld l,b'),
    Opcode.new('ld l,c'),
    Opcode.new('ld l,d'),
    Opcode.new('ld l,e'),
    Opcode.new('ld l,h'),
    Opcode.new('ld l,l'),
    Opcode.new('ld l,(hl)'),
    Opcode.new('ld l,a'),

    # 0x7N
    Opcode.new('ld (hl),b'),
    Opcode.new('ld (hl),c'),
    Opcode.new('ld (hl),d'),
    Opcode.new('ld (hl),e'),
    Opcode.new('ld (hl),h'),
    Opcode.new('ld (hl),l'),
    Opcode.new('halt'),
    Opcode.new('ld (hl),a'),
    Opcode.new('ld a,b'),
    Opcode.new('ld a,c'),
    Opcode.new('ld a,d'),
    Opcode.new('ld a,e'),
    Opcode.new('ld a,h'),
    Opcode.new('ld a,l'),
    Opcode.new('ld a,(hl)'),
    Opcode.new('ld a,a'),

    # 0x8N
    Opcode.new('add a,b'),
    Opcode.new('add a,c'),
    Opcode.new('add a,d'),
    Opcode.new('add a,e'),
    Opcode.new('add a,h'),
    Opcode.new('add a,l'),
    Opcode.new('add a,(hl)'),
    Opcode.new('add a,a'),
    Opcode.new('adc a,b'),
    Opcode.new('adc a,c'),
    Opcode.new('adc a,d'),
    Opcode.new('adc a,e'),
    Opcode.new('adc a,h'),
    Opcode.new('adc a,l'),
    Opcode.new('adc a,(hl)'),
    Opcode.new('adc a,a'),

    # 0x9N
    Opcode.new('sub b'),
    Opcode.new('sub c'),
    Opcode.new('sub d'),
    Opcode.new('sub e'),
    Opcode.new('sub h'),
    Opcode.new('sub l'),
    Opcode.new('sub (hl)'),
    Opcode.new('sub a'),
    Opcode.new('sbc a,b'),
    Opcode.new('sbc a,c'),
    Opcode.new('sbc a,d'),
    Opcode.new('sbc a,e'),
    Opcode.new('sbc a,h'),
    Opcode.new('sbc a,l'),
    Opcode.new('sbc a,(hl)'),
    Opcode.new('sbc a,a'),

    # 0xAN
    Opcode.new('and b'),
    Opcode.new('and c'),
    Opcode.new('and d'),
    Opcode.new('and e'),
    Opcode.new('and h'),
    Opcode.new('and l'),
    Opcode.new('and (hl)'),
    Opcode.new('and a'),
    Opcode.new('xor b'),
    Opcode.new('xor c'),
    Opcode.new('xor d'),
    Opcode.new('xor e'),
    Opcode.new('xor h'),
    Opcode.new('xor l'),
    Opcode.new('xor (hl)'),
    Opcode.new('xor a'),

    # 0xBN
    Opcode.new('or b'),
    Opcode.new('or c'),
    Opcode.new('or d'),
    Opcode.new('or e'),
    Opcode.new('or h'),
    Opcode.new('or l'),
    Opcode.new('or (hl)'),
    Opcode.new('or a'),
    Opcode.new('cp b'),
    Opcode.new('cp c'),
    Opcode.new('cp d'),
    Opcode.new('cp e'),
    Opcode.new('cp h'),
    Opcode.new('cp l'),
    Opcode.new('cp (hl)'),
    Opcode.new('cp a'),

    # 0xCN
    Opcode.new('ret nz'),
    Opcode.new('pop bc'),
    Opcode.new('jp nz,xx', step: 3),
    Opcode.new('jp xx', step: 3),
    Opcode.new('call nz,xx', step: 3),
    Opcode.new('push bc'),
    Opcode.new('add a,x', step: 2),
    Opcode.new('rst 00h'),
    Opcode.new('ret z'),
    Opcode.new('ret'),
    Opcode.new('jp z,xx', step: 3),
    Opcode.new('xxBITxx', step: 2),
    Opcode.new('call z,xx', step: 3),
    Opcode.new('call xx', step: 3),
    Opcode.new('adc a,x', step: 2),
    Opcode.new('rst 08h'),

    # 0xDN
    Opcode.new('ret nc'),
    Opcode.new('pop de'),
    Opcode.new('jp nc,xx', step: 3),
    Opcode.new('out (x),a', step: 2),
    Opcode.new('call nc,xx', step: 3),
    Opcode.new('push de'),
    Opcode.new('sub x', step: 2),
    Opcode.new('rst 10h'),
    Opcode.new('ret c'),
    Opcode.new('exx'),
    Opcode.new('jp c,xx', step: 3),
    Opcode.new('in a,(x)', step: 2),
    Opcode.new('call c,xx', step: 3),
    Opcode.new('xxIXxx', step: 2),
    Opcode.new('sbc a,x', step: 2),
    Opcode.new('rst 18h'),

    # 0xEN
    Opcode.new('ret po'),
    Opcode.new('pop hl'),
    Opcode.new('jp po,xx', step: 3),
    Opcode.new('ex (sp),hl'),
    Opcode.new('call po,xx', step: 3),
    Opcode.new('push hl'),
    Opcode.new('and x', step: 2),
    Opcode.new('rst 20h'),
    Opcode.new('ret pe'),
    Opcode.new('jp (hl)'),
    Opcode.new('jp pe,xx', step: 3),
    Opcode.new('ex de,hl'),
    Opcode.new('call pe,xx', step: 3),
    Opcode.new('xx80xx', step: 2),
    Opcode.new('xor x', step: 2),
    Opcode.new('rst 28h'),

    # 0xFN
    Opcode.new('ret p'),
    Opcode.new('pop af'),
    Opcode.new('jp p,xx', step: 3),
    Opcode.new('di'),
    Opcode.new('call p,xx', step: 3),
    Opcode.new('push af'),
    Opcode.new('or x', step: 2),
    Opcode.new('rst 30h'),
    Opcode.new('ret m'),
    Opcode.new('ld sp,hl'),
    Opcode.new('jp m,xx', step: 3),
    Opcode.new('ei'),
    Opcode.new('call m,xx', step: 3),
    Opcode.new('xxIYxx'),
    Opcode.new('cp x', step: 2),
    Opcode.new('rst 38h'),
  ].freeze

  def self.opcode(instruction)
    TABLE[instruction]
  end
end
