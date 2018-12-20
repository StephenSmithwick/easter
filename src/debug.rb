require 'optparse'
require 'yaml'
require 'basket'


def load_basket(basket)
  yaml_file = File.expand_path("baskets/#{basket}.yml", ENV['EASTER_HOME'])
  Basket.load yaml_file
end
