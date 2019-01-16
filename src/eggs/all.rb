$LOAD_PATH.map do |lp|
  Dir[File.expand_path('eggs/*.rb', lp)]
end.flatten.each do|file|
  require file
end

module Eggs
  class All
    def self.[](type)
      Eggs.constants.map do |constant|
        Eggs.const_get constant
      end.find do |clazz|
        clazz.respond_to?(:handles?) && clazz.handles?(type.to_s)
      end
    end
  end
end
