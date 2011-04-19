module EZproxy
  class Log
    attr_accessor :format

    def initialize(attributes)
      @format = EZproxy::Log::Format.new(attributes[:format])
    end

    # Load and parse `filename`
    def parse_file(filename)
      matcher = @format.to_regex
      defined_attributes = @format.defined_attributes

      File.open(filename) do |file|
        file.each_line do |line|
          m = line.match(matcher).to_a

          r = {}
          m[1..m.count].zip(defined_attributes).each do |match, attr|
            r[attr[:label]] = match
          end

          if block_given?
            yield r
          else
            r
          end
        end
      end
    end
  end
end
