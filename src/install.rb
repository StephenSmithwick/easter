require 'optparse'
require 'yaml'

yaml_file = nil
install_options=""
OptionParser.new do |opts|
  opts.on('--yml FILE', 'The YAML egg basket to load dependencies from')   { |o| yaml_file = o }
  opts.on('--force', 'Attempt to force an install if there is a conflict') { |o| install_options += " --force" }
  opts.on_tail('--help')                                                   { |o| puts opts; exit }
end.parse!

require 'terminal'
require 'basket'

basket = Basket.load yaml_file

puts "#{colorIcon(BG[:blue], :hen)} #{colorize(FG[:blue], basket.title)}"
basket.eggs.each do | egg |
  if egg.installed?
    puts indent "#{colorIcon(BG[:blue], :baby_chick)} Hatched: #{colorize(BG[:green], egg.title)}"
  else
    puts indent "#{colorIcon(BG[:blue], :hatching_chick)} Hatching: #{colorize(BG[:yellow], egg.title)}"
    egg.install(install_options)
  end
end
