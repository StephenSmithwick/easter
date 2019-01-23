require 'simple_struct'

module Eggs
  class Brew < SimpleStruct(:title, :formula, :version, :options)
    def self.handles?(type)
      type == "brew"
    end

    def self.parse(value)
      case value
      when Hash then   Brew.new(value)
      when String then Brew.new(parse_oneliner value)
      else raise "#{item} not understood properly as a Brew"
      end
    end

    def self.parse_oneliner(line)
      line, options = line.split(" ", 2)
      formula, version = line.split("@", 2)
      { formula: formula, version: version, options: options }
    end

    def title
      super || formula
    end

    def versioned_formula
      version ? "#{formula}@#{version}" : formula
    end

    def installed?
      `brew ls`.split.include?(versioned_formula)
    end

    def install
      `brew install #{versioned_formula} #{options}`
    end
  end
end
