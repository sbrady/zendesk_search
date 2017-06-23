class CliInterface

  def initialize
    @command_buffer = []
  end

  def buffer_command(command)
    @command_buffer << command
  end

  def run
    command = "echo '#{@command_buffer.join('\n')}' | ./bin/zendesk_search.rb"
    @recent_stdin_out = `#{command}`
  end


  def recent_lines
    @recent_stdin_out.split("\n")
  end

end

World do
  CliInterface.new
end

