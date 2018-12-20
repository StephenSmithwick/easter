require 'simple_struct'

module Eggs
  class Cask < SimpleStruct(:title, :formula)
    def self.handles?(type)
      type == "cask"
    end

    def self.parse(value)
      case value
      when Hash then   Cask.new(value)
      when String then Cask.new(title: value, formula: value)
      else raise "#{item} not understood properly as a Cask"
      end
    end

    def installed?
      `brew cask ls`.split.include?(formula)
    end

    def install
      `brew cask install #{formula}`
    end
  end
end
