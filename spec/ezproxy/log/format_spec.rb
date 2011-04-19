require 'spec_helper'

describe EZproxy::Log::Format do 
  it "should have a format accessor" do
    @format = EZproxy::Log::Format.new('%h %{ezproxy-session}i %u %t "%r" %s %b')
    @format.format.should == '%h %{ezproxy-session}i %u %t "%r" %s %b'

    @format.format = '%h %u %t "%r" %s %b'
    @format.format.should == '%h %u %t "%r" %s %b'
  end

  it "should convert to a regular expression" do
    @format = EZproxy::Log::Format.new('%h %{ezproxy-session}i %u %t "%r" %s %b')
    @format.to_regex.class.should == Regexp
  end

  it "should properly identify which match is which attribute" do
    @format = EZproxy::Log::Format.new('%h %{ezproxy-session}i %u %t "%r" %s %b')
    defined_attributes = @format.defined_attributes

    defined_attributes[0][:label].should == 'remote_host'
    defined_attributes[1][:label].should == 'ezproxy_session'
    defined_attributes[2][:label].should == 'username'
    defined_attributes[3][:label].should == 'happened_at'
    defined_attributes[4][:label].should == 'http_request'
    defined_attributes[5][:label].should == 'http_status'
    defined_attributes[6][:label].should == 'http_bytes'
  end
end
