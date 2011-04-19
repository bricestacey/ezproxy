# EZproxy

This is a general purpose gem for working with OCLC's EZproxy

## Supported File Formats

The following formats are currently supported:

* %h
* %l
* %u
* %t
* %r
* %s
* %b
* %U
* %{ezproxy-session}i

## Examples

    require 'ezproxy'

    @log = EZproxy::Log.new(:format => '%h %{ezproxy-session}i %u %t "%r" %s %b')
    @log.parse_file('ezp201104.log') do |line|
      puts line.inspect
    end

Will output something like the following for each line

    {"remote_host"=>"127.0.0.1", "ezproxy_session"=>"-", "username"=>"-", "happened_at"=>"19/Apr/2011:13:31:38 -0500", "http_request"=>"GET https://localhost:443/favicon.ico HTTP/1.1", "http_status"=>"404", "http_bytes"=>"0"}
