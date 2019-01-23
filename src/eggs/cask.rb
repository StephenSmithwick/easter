require 'simple_struct'

module Eggs
  class Cask < SimpleStruct(:title, :formula, :version, :options)
    def self.handles?(type)
      type == "cask"
    end

    def self.parse(value)
      case value
      when Hash then   Cask.new(value)
      when String then Cask.new(parse_oneliner value)
      else raise "#{item} not understood properly as a Cask"
      end
    end

    def self.parse_oneliner(line)
      line, options = line.split(" ", 2)
      formula, version = line.split("@", 2)
      { formula: formula, version: version, options: options }
    end

    def title
      super || versioned_formula
    end

    def versioned_formula
      "#{formula}#{version}"
    end

    def installed?
      `brew cask ls`.split.include?(versioned_formula)
    end

    def install
      `brew cask install #{versioned_formula} #{options}`
    end
  end
end
