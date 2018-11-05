def SimpleStruct(*parameters)
  Struct.new(*parameters)  do
    def initialize(opts)
      assign(opts)
    end

    def assign(opts)
      opts.each {|k,v| self.send("#{k}=", v)}
    end
  end
end
