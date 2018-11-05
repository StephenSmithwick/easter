require 'simple_struct'

module Resolvers
  class Brew < SimpleStruct(:title, :formula)
    def self.handles?(type)
      type == "brew"
    end

    def self.dependency(item)
      case item
      when Hash then   Brew.new(item)
      when String then Brew.new(title: item, formula: item)
      else raise "#{item} not understood properly as a Brew"
      end
    end

    def installed?
      `brew ls`.split.include?(formula)
    end

    def install
      puts "brew install #{formula}"
      `brew install #{formula}`
    end
  end
end
