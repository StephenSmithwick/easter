require 'simple_struct'

module Eggs
  class Shell < SimpleStruct(:title, :bin, :assert, :script, :ask)
    def self.handles?(type)
      type == "shell"
    end

    def self.parse(value)
      value['title'] ||= value['bin']
      Shell.new(value)
    end

    def installed?
      assert? && bin?
    end

    def install
      shell(script % ask_responses)
    end

    def assert?
      assert.nil? || shell(assert["that"]) == assert["is"].strip
    end

    def bin?
      bin.nil? || ! shell("which #{bin}").empty?
    end

    def ask_responses
      ask.map do |key, question|
        puts question
        response = gets.strip

        [key.to_sym, response]
      end.to_h if ask
    end

    def shell(command)
      `#{command.split("\n").join("; ")}`.strip
    end
  end
end
