$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'vcr'
require "bishl"

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

# configure vcr
#VCR.config do |c|
#  c.cassette_library_dir = '#{File.dirname(__FILE__)}/fixtures/vcr_cassettes'
#  c.stub_with :webmock # or :fakeweb
#end



RSpec.configure do |config|

  config.before do
    #VCR.use_cassette('synopsis') do
    #  Net::HTTP.get_response(URI('http://www.bishl.de/rss/schedule.xml.php?season=2011&cs=LLA'))
    #end
  end

end


