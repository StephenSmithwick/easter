require 'optparse'
require 'yaml'

yaml_file = nil
OptionParser.new do |opts|
  opts.on('--yml FILE', 'The YAML egg basket to load dependencies from')  { |o| yaml_file = o }
  opts.on_tail('--help')                                            { |o| puts opts; exit }
end.parse!

require 'terminal'
require 'basket'

basket = Basket.load yaml_file

puts "#{colorIcon(BG[:blue], :hen)} #{colorize(BG[:white], basket.title)}"
basket.eggs.each do | egg |
  if egg.installed?
    puts indent "#{colorIcon(BG[:blue], :baby_chick)} Hatched: #{colorize(BG[:green], egg.title)}"
  else
    puts indent "#{colorIcon(BG[:blue], :hatching_chick)} Hatching: #{colorize(BG[:yellow], egg.title)}"
    egg.install
  end
end
