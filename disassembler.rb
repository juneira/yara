require './table.rb'

class Disassembler
  def initialize(file_name)
    @bin_file =  File.open(file_name, 'rb')
  end

  def run
    while byte = read_next_byte
      opcode = Table.opcode(byte)

      opcode = Table::Bit.opcode(read_next_byte) if opcode.name == 'xxBITxx'
      opcode = Table::Misc.opcode(read_next_byte) if opcode.name == 'xx80xx'

      puts opcode.name

      bin_file.read(opcode.step - 1)
    end

    bin_file.close
  end

  private

  attr_reader :bin_file

  def read_next_byte
    bin_file.read(1)&.unpack('C')&.first
  end
end
