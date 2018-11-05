require 'optparse'
require 'yaml'

yaml_file = nil
OptionParser.new do |opts|
  opts.on('--yml FILE', 'The YAML file to load dependencies from')  { |o| yaml_file = o }
  opts.on_tail('--help')                                            { |o| puts opts; exit }
end.parse!

require 'terminal'
Dir[File.expand_path('../resolvers/*.rb', __FILE__)].each {|file| require file }
resolvers = Resolvers.constants.map{|c| Resolvers.const_get(c)}.select {|c| c.is_a? Class}

yaml = YAML.load(File.open(yaml_file))

puts "#{ICONS[:sun]} - Installing #{yaml['title']}"
yaml.each do | resolver_type, items |
  resolver = resolvers.find{|resolver| resolver.handles? resolver_type}
  next if resolver.nil?

  items.each do | item |
    dep = resolver.dependency(item)
    if dep.installed?
      puts indent "#{ICONS[:tree]} - Found: #{dep.title}"
    else
      puts indent "#{ICONS[:seedling]} - Installing #{dep.title}"
      dep.install
    end
  end
end
