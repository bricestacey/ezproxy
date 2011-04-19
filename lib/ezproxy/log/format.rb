module EZproxy
  class Log
    class Format
      attr_accessor :format

      # Array containing each log format
      # An attribute must contain a :token, :regexp, and :label.
      # Optional keys include :post
      ATTRIBUTES = [
        {:token => '%h',
         :regexp => /([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})/,
         :label => 'remote_host'},
        {:token => '%l',
         :regexp => /(-)/,
         :label  => nil},
        {:token => '%u',
         :regexp => /(.*)/,
         :label  => 'username'},
        {:token => '%t',
         :regexp => /\[(.*)\]/,
         :post   => Proc.new {|x| x[11] = ' '},
         :label  => 'happened_at'},
        {:token => '%r',
         :regexp => /(.*)/,
         :label  => 'http_request'},
        {:token => '%s',
         :regexp => /(\d+)/,
         :label  => 'http_status'},
        {:token => '%b',
         :regexp => /(\d+)/,
         :label  => 'http_bytes'},
        {:token => '%U',
         :regexp => /([^ ]+)/,
         :label  => 'http_url'},
        {:token => '%{ezproxy-session}i',
         :regexp => /(.*)/,
         :label  => 'ezproxy_session'}
      ]

      def initialize(s)
        @format = s
      end

      def to_regex
        regex = @format.clone
        ATTRIBUTES.each do |regexp|
          regex.gsub!(regexp[:token], regexp[:regexp].source)
        end

        Regexp.compile(regex)
      end

      def defined_attributes
        l = []
        ATTRIBUTES.each do |attr|
          l[@format.index(attr[:token])] = attr if @format.include? attr[:token]
        end

        l.compact
      end
    end
  end
end
