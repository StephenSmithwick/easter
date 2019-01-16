require 'optparse'
require 'yaml'
require 'simple_struct'
require 'eggs/all'

class Basket < SimpleStruct(:file, :title, :basket)
  def self.load(yaml_file)
    yaml = YAML.load(File.open(yaml_file))

    Basket.new(file: yaml_file, title: yaml['title'], basket: yaml['basket']).validate
  end

  def egg_map
    basket.flat_map do | eggs |
      eggs.flat_map do | type, value |
        [*value].map do |egg_yaml|
          yield type, egg_yaml
        end
      end
    end
  end

  def validate
    egg_map do | type |
      clazz = Eggs::All[type]
      raise "from #{file} - Unknown type: '#{type}'"  if clazz.nil?
    end

    self
  end

  def eggs
    @eggs ||= egg_map do |type, egg_yaml|
      Eggs::All[type].parse(egg_yaml)
    end
  end

end
