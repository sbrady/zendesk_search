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
    return @program_ender.shut_down! if input == 'quit'
    @current_controller = handle_input(input)
  end

  private

  def handle_input(input)
    begin
      @current_controller.next_controller(input)
    rescue InvalidInputError => iie
      puts "#{iie.message}\n"
      @current_controller
    end
  end

end
