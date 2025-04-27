# spec/spec_helper.rb
require 'rack/test'
require 'rspec'

# Determine the root directory of the project
# This assumes spec_helper.rb is in the 'spec' directory
ENV['RACK_ENV'] = 'test'
project_root = File.expand_path('..', __dir__)

# Add the project root to the load path so we can require 'app'
$LOAD_PATH.unshift(project_root) unless $LOAD_PATH.include?(project_root)

# Require the Sinatra application file
require 'app'

module RSpecMixin
  include Rack::Test::Methods
    def app() Sinatra::Application end
    end

    # Configure RSpec
    RSpec.configure do |config|
      config.include RSpecMixin

        config.expect