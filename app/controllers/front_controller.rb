require 'forwardable'
class FrontController
  extend Forwardable

  def_delegator :@current_controller, :render

  def initialize(init_controller)
    @current_controller = init_controller
  end

  def process(input=nil)
    input = input ? input.strip : nil
    @current_controller = @current_controller.next_controller(input)
  end

end
