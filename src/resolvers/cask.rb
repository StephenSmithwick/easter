require 'simple_struct'

module Resolvers
  class Cask < SimpleStruct(:title, :formula)
    def self.handles?(type)
      type == "cask"
    end

    def self.dependency(item)
      case item
      when Hash then   Cask.new(item)
      when String then Cask.new(title: item, formula: item)
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
