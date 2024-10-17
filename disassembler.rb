require './table'

class Disassembler
  def initialize(file_name)
    @bin_file =  File.open(file_name, 'rb')
    @output = ''
  end

  def run
    while byte = read_next_byte
      opcode = Table.opcode(byte)

      opcode = Table::Bit.opcode(read_next_byte) if opcode.name == 'xxBITxx'
      opcode = Table::Misc.opcode(read_next_byte) if opcode.name == 'xx80xx'
      opcode = Table::IX.opcode(read_next_byte) if opcode.name == 'xxIXxx'
      opcode = Table::IY.opcode(read_next_byte) if opcode.name == 'xxIYxx'

      offs = nil

      if opcode.name == 'IX BIT'
        offs = read_next_byte
        opcode = Table::IXBit.opcode(read_next_byte)
      elsif opcode.name == 'IY BIT'
        offs = read_next_byte
        opcode = Table::IYBit.opcode(read_next_byte)
      end

      @output << show_opcode(opcode, offs) << "\n"
    end

    bin_file.close
    @output
  end

  private

  attr_reader :bin_file

  def read_next_byte
    bin_file.read(1)&.unpack('C')&.first
  end

  def show_opcode(opcode, offs = nil)
    return opcode.name.gsub('d', "#{offs.to_s(16)}h") if offs
    return opcode.name if opcode.step == 1

    n = bin_file.read(opcode.step - 1)
    xx = n.unpack("C#{opcode.step - 1}").map { |b| b.to_s(16) }.reverse.join('')

    opcode.name.gsub('xx', 'x').gsub('x', "#{xx}h")
  end
end
