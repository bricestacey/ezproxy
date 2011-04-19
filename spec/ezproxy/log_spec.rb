require 'spec_helper'

describe EZproxy::Log do
  it "should load a log from a file" do
    @log = EZproxy::Log.new(:format => '%h %{ezproxy-session}i %u %t "%r" %s %b')

    @log.parse_file('spec/ezproxy/test.log') do |line|
      line['remote_host'].should == '127.0.0.1'
      line['ezproxy_session'].should == 'itiFqehv7PMNRYl'
      line['username'].should == 'brice'
      line['happened_at'].should == '18/May/2009:12:55:27 -0500'
      line['http_request'].should == 'GET http://localhost:80/connect?session=sitiFqehv7PMNRYl&url=http://localhost/admin HTTP/1.1'
      line['http_status'].should == "302"
      line['http_bytes'].should == "0"
    end
  end
end
