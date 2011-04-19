$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'ezproxy'
require 'rspec'

Rspec.configure do |config|
  config.mock_with :rspec
end
