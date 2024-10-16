require './opcode.rb'

class Table
  class IY
    TABLE = [
      # 0x0N
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('add IY,bc'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,

      # 0x1N
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('add IY,de'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,

      # 0x2N
      nil,
      Opcode.new('ld IY,xx', step: 3),
      Opcode.new('ld (xx),IY', step: 3),
      Opcode.new('inc IY'),
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('add IY,IY'),
      Opcode.new('ld IY,(xx)', step: 3),
      Opcode.new('dec IY'),
      nil,
      nil,
      nil,
      nil,

      #0x3N
      nil,
      nil,
      nil,
      nil,
      Opcode.new('inc (IY+d)'),
      Opcode.new('dec (IY+d)'),
      Opcode.new('ld (IY+d),x', step: 2),
      nil,
      nil,
      Opcode.new('add IY,sp'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,

      #0x4N
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('ld b,(IY+d)'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('ld c,(IY+d)'),
      nil,

      #0x5N
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('ld d,(IY+d)'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('ld e,(IY+d)'),
      nil,

      #0x6N
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('ld h,(IY+d)'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('ld l,(IY+d)'),
      nil,

      #0x7N
      Opcode.new('ld (IY+d),b'),
      Opcode.new('ld (IY+d),c'),
      Opcode.new('ld (IY+d),d'),
      Opcode.new('ld (IY+d),e'),
      Opcode.new('ld (IY+d),h'),
      Opcode.new('ld (IY+d),l'),
      nil,
      Opcode.new('ld (IY+d),a'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('ld a,(IY+d)'),
      nil,

      #0x8N
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('add a,(IY+d)'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('adc a,(IY+d)'),
      nil,

      #0x9N
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('sub (IY+d)'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('sbc a,(IY+d)'),
      nil,

      #0xAN
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('and (IY+d)'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('xor (IY+d)'),
      nil,

      #0xBN
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('or (IY+d)'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('cp (IY+d)'),
      nil,

      #0xCN
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('IY BIT'),
      nil,
      nil,
      nil,
      nil,

      #0xDN
      nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil,

      #0xEN
      nil,
      Opcode.new('pop IY'),
      nil,
      Opcode.new('ex (sp),IY'),
      nil,
      Opcode.new('push IY'),
      nil,
      nil,
      nil,
      Opcode.new('jp (IY)'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,

      #0xFN
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      Opcode.new('ld sp,IY'),
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
    ].freeze

    def self.opcode(instruction)
      TABLE[instruction]
    end
  end
end
