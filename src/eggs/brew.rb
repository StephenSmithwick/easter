require 'simple_struct'

module Eggs
  class Brew < SimpleStruct(:title, :formula)
    def self.handles?(type)
      type == "brew"
    end

    def self.parse(value)
      case value
      when Hash then   Brew.new(value)
      when String then Brew.new(title: value, formula: value)
      else raise "#{item} not understood properly as a Brew"
      end
    end

    def installed?
      `brew ls`.split.include?(formula)
    end

    def install
      `brew install #{formula}`
    end
  end
end
