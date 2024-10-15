require './opcode.rb'

class Table
  class Misc
    TABLE = [
      # 0x0N
      nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,

      # 0x1N
      nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,

      # 0x2N
      nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,

      # 0x3N
      nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,

      # 0x4N
      Opcode.new('in b,(c)'),
      Opcode.new('out (c),b'),
      Opcode.new('sbc hl,bc'),
      Opcode.new('ld (xx),bc', step: 3),
      Opcode.new('neg'),
      Opcode.new('retn'),
      Opcode.new('im 0'),
      Opcode.new('ld i,a'),
      Opcode.new('in c,(c)'),
      Opcode.new('out (c),c'),
      Opcode.new('adc hl,bc'),
      Opcode.new('ld bc,(xx)', step: 3),
      Opcode.new('neg'),
      Opcode.new('reti'),
      nil,
      Opcode.new('ld r,a'),

      # 0x5N
      Opcode.new('in d,(c)'),
      Opcode.new('out (c),d'),
      Opcode.new('sbc hl,de'),
      Opcode.new('ld (xx),de', step: 3),
      Opcode.new('neg'),
      Opcode.new('retn'),
      Opcode.new('im 1'),
      Opcode.new('ld a,i'),
      Opcode.new('in e,(c)'),
      Opcode.new('out (c),e'),
      Opcode.new('adc hl,de'),
      Opcode.new('ld de,(xx)', step: 3),
      Opcode.new('neg'),
      Opcode.new('retn'),
      Opcode.new('im 2'),
      Opcode.new('ld a,r'),

      # 0x6N
      Opcode.new('in h,(c)'),
      Opcode.new('out (c),h'),
      Opcode.new('sbc hl,hl'),
      Opcode.new('ld (xx),hl', step: 3),
      Opcode.new('neg'),
      Opcode.new('retn'),
      nil,
      Opcode.new('rrd'),
      Opcode.new('in l,(c)'),
      Opcode.new('out (c),l'),
      Opcode.new('adc hl,hl'),
      Opcode.new('ld hl,(xx)', step: 3),
      Opcode.new('neg'),
      Opcode.new('retn'),
      nil,
      Opcode.new('rld'),

      # 0x7N
      Opcode.new('in f,(c)'),
      Opcode.new('out (c),0'),
      Opcode.new('sbc hl,sp'),
      Opcode.new('ld (xx),sp', step: 3),
      Opcode.new('neg'),
      Opcode.new('retn'),
      nil,
      nil,
      Opcode.new('in a,(c)'),
      Opcode.new('out (c),a'),
      Opcode.new('adc hl,sp'),
      Opcode.new('ld sp,(xx)', step: 3),
      Opcode.new('neg'),
      Opcode.new('reti'),
      nil,
      nil,

      # 0x8N
      nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,

      # 0x9N
      nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,

      # 0xAN
      Opcode.new('ldi'),
      Opcode.new('cpi'),
      Opcode.new('ini'),
      Opcode.new('outi'),
      nil,
      nil,
      nil,
      nil,
      Opcode.new('ldd'),
      Opcode.new('cpd'),
      Opcode.new('ind'),
      Opcode.new('outd'),
      nil,
      nil,
      nil,
      nil,

      # 0xBN
      Opcode.new('ldir'),
      Opcode.new('cpir'),
      Opcode.new('inir'),
      Opcode.new('otir'),
      nil,
      nil,
      nil,
      nil,
      Opcode.new('lddr'),
      Opcode.new('cpdr'),
      Opcode.new('indr'),
      Opcode.new('otdr'),
      nil,
      nil,
      nil,
      nil,

      # 0xCN
      nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,

      # 0xDN
      nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,

      # 0xEN
      nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,

      # 0xFN
      nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,
    ].freeze

    def self.opcode(instruction)
      TABLE[instruction]
    end
  end
end
