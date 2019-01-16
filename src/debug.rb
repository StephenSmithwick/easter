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

def install(basket)
  lb(basket).eggs.each do |egg|
    puts "Checking: #{egg.title} - installed: #{egg.installed?}"
    egg.install unless egg.installed?
  end
end

def instructions
  puts <<~END_HELP
    __--:[Easter-REPL]:--__
    List baskets:
    > ls

    Load a basket:
    > lb [basket]

    Install basket:
    > install [basket]

    Display this help messgae by:
    > instructions
  END_HELP
end

instructions
