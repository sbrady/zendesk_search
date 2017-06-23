#!/usr/bin/env ruby
require_relative '../app/boot'
include DependencyInjector

puts front_controller.process.render
ARGF.each do |line|
  puts front_controller.process(line).render
end


