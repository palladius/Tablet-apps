# spec/app_spec.rb
require 'spec_helper' # Loads the configuration

describe 'My Sinatra Application' do
  it 'should allow accessing the home page' do
    # Use Rack::Test 'get' helper method included via RSpecMixin
    get '/'

    # 'last_response' is provided by Rack::Test
    expect(last_response).to be_ok # Asserts that the status code is 2xx
    expect(last_response.body).to include('Hello World!') # Check content
  end

  it 'should respond to the hello route' do
    get '/hello/Tester'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello, Tester!')
  end

  it 'should return 404 for unknown routes' do
    get '/non-existent-route'
    expect(last_response.status).to eq(404)
  end
end