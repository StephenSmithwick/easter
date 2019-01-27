require 'simple_struct'

module Eggs
  class Shell < SimpleStruct(:title, :bin, :assert, :exists, :script, :ask, :eval)
    def self.handles?(type)
      type == "shell"
    end

    def self.parse(value)
      value['assert'] = parse_assertion value['assert'] if value.key?('assert')
      Shell.new(value)
    end

    def self.parse_assertion(line)
      that, is = case line
      when Hash then [line["that"], line["is"]]
      when String then line.match(/that (.*) is (.*)/).captures
      else raise "'#{line}' not understood properly as an assertion"
      end
      {that: that, is: is}
    end

    def title
      super || bin
    end

    def installed?
      assert? && bin? && file_exists?
    end

    def install(install_options)
      puts "Installing "
      shell(script % lazy_vars)
    end

    def assert?
      assert.nil? || shell(assert[:that] % lazy_vars) == (assert[:is] % lazy_vars).strip
    end

    def bin?
      bin.nil? || ! shell("which #{bin}").empty?
    end

    def file_exists?
      exists.nil? || File.exist?(File.expand_path exists)
    end

    def lazy_vars
      @lazy_vars ||= Hash.new do |hash, key|
        hash[key] = eval_response(key) || ask_response(key)
      end
    end

    def ask_response(key)
      return if ask.nil?
      question = ask[key.to_s]
      return if question.nil?

      puts question
      gets.strip
    end

    def eval_response(key)
      return if eval.nil?
      cmd = eval[key.to_s]
      return if cmd.nil?

      shell(cmd)
    end

    def shell(command)
      `#{command.split("\n").join("; ")}`.strip
    end
  end
end
