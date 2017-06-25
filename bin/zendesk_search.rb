#!/usr/bin/env ruby
require_relative '../app/boot'


class Main
  include DependencyInjector

  def run
    puts front_controller.next_controller.render
    ARGF.each do |line|
      puts front_controller.next_controller(line).render
    end
  end
end

Main.new.run



