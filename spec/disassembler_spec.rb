require './disassembler'

describe Disassembler do
  subject { Disassembler.new(file_path).run }

  let(:file_path) { './examples/test.rom' }

  it 'returns a string with assembly of binary file' do
    is_expected.to eq(
    <<~ASM
    ld a,25h
    ld b,25h
    ld c,25h
    ld d,25h
    ld e,25h
    ld a,b
    ld b,c
    ld d,a
    rlc b
    set 7,a
    set 6,(hl)
    res 0,(hl)
    in b,(c)
    rrd
    ld sp,(afffh)
    ld de,(afffh)
    im 2
    pop IX
    ld sp,IX
    ld (e0a9h),IX
    pop IY
    ld sp,IY
    ld (e0a9h),IY
    bit 4,(IX+ah)
    bit 4,(IY+ah)
    set 7,(IX+fh)
    set 7,(IX+fh)
    ASM
    )
  end
end