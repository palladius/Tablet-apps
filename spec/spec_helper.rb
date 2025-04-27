



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
require 'app' # Make sure your main app file is named app.rb in the root

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

# Configure RSpec
RSpec.configure do |config|
  # Include the Rack::Test methods for RSpec
  config.include RSpecMixin

  # Other RSpec configuration options can go here
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Optional: More configurations like order, filtering, etc.
  # config.filter_run_when_matching :focus
  # config.order = :random
  # Kernel.srand config.seed
end
