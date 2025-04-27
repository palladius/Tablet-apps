require 'sinatra'

# Route for the homepage
get '/' do
  "Hello World! Welcome to Sinatra on Codespaces."
  end

  # Another example route
  get '/hello/:name' do
    "Hello, #{params['name']}!"
    end


    