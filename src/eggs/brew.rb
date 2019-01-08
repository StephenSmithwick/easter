require 'simple_struct'

module Eggs
  class Brew < SimpleStruct(:title, :formula, :options)
    def self.handles?(type)
      type == "brew"
    end

    def self.parse(value)
      case value
      when Hash then   Brew.new(value)
      when String then Brew.new(formula: value)
      else raise "#{item} not understood properly as a Brew"
      end
    end

    def installed?
      `brew ls`.split.include?(formula)
    end

    def title
      super || formula
    end

    def install
      `brew install #{formula} #{options}`
    end
  end
end
