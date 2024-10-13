class Opcode
  attr_reader :name, :step

  def initialize(name, step: 1)
    @name = name
    @step = step
  end
end