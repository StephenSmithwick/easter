require 'optparse'
require 'yaml'
require 'basket'


def lb(basket)
  yaml_file = File.expand_path("baskets/#{basket}.yml", ENV['EASTER_HOME'])
  Basket.load yaml_file
end

def ls
  extract_basket_name = -> (file) { file.split('/').find{|x| x.end_with? ".yml"}.sub(".yml","") }
  baskets = Dir[File.expand_path("baskets/*.yml", ENV['EASTER_HOME'])]

  puts baskets
    .map{|file| ":#{extract_basket_name.call file} -> #{file}"}
    .join("\n")
end

def instructions
  puts "Load a basket by: "
  puts "> lb [basket]"
  puts "List baskets by: "
  puts "> ls"
  puts "Display this help messgae by: "
  puts "> instructions"
end

instructions
