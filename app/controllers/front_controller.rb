require 'forwardable'
class FrontController
  extend Forwardable

  def_delegator :@current_controller, :render

  def initialize(init_controller, program_ender)
    @current_controller = init_controller
    @program_ender = program_ender
  end

  def process(input=nil)
    return @current_controller if input.nil?
    input = input.strip
    @program_ender.shut_down! if input == 'quit'
    @current_controller = @current_controller.next_controller(input)
  end

end
