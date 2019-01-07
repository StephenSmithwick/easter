require 'optparse'
require 'yaml'
require 'simple_struct'

$LOAD_PATH.map {|lp|  Dir[File.expand_path('eggs/*.rb', lp)] }.flatten.each {|file| require file }

class Basket < SimpleStruct(:title, :eggs)
  def self.load(yaml_file)
    egg_loaders = Eggs.constants.map{|c| Eggs.const_get(c)}.select {|c| c.is_a? Class}
    yaml = YAML.load(File.open(yaml_file))

    Basket.new(
      title: yaml['title'],
      eggs: yaml['basket'].flat_map do | eggs |
        eggs.flat_map do | egg_type, egg_list |
          egg_loader = egg_loaders.find{|egg| egg.handles? egg_type}
          raise "In file: #{yaml_file}\n - Unknown egg type: #{egg_type}"  unless egg_loader
          raise "In file: #{yaml_file}\n - No eggs found for: #{egg_type}" unless egg_list

          egg_list.map do | egg_yaml |
            egg_loader.parse(egg_yaml)
          end
        end
      end)
  end
end
