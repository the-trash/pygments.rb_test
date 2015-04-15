require 'rubygems'
require 'bundler/setup'

require 'pygments.rb'
require 'pry'

ENV['MENTOS_LOG'] = "#{ Dir.pwd }/log.log"

puts "*"*30
if (pygments_path = `which pygmentize`).chop.empty?
  puts "System `pygmentize` not found"
else
  puts "System `pygmentize`: #{ pygments_path }"
  Pygments.start pygments_path
end

puts "*"*30
puts "TEST `HTML` + `CSS`"
puts "*"*30
puts Pygments.highlight('.div Hello', lexer: :slim)
puts Pygments.css(style: :monokai)

puts "*"*30
puts "LEXERS"
puts "*"*30
Pygments.lexers.sort{|a,b| a.first <=> b.first }.each_with_index do |lexer, index|
  puts "#{ index }. #{ lexer.first } => #{ lexer.last[:aliases].join ?, }"
end

puts "*"*30
puts "FORMATTERS"
puts "*"*30
Pygments.formatters.sort{|a,b| a.first <=> b.first }.each_with_index do |formatter, index|
  puts "#{ index }. #{ formatter.first } => #{ formatter.last[:aliases].join ?, }"
end

puts "*"*30
puts "STYLES"
puts "*"*30
puts Pygments.styles
puts "*"*30
