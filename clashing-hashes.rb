require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  # '<h1>hello joe and yasmin</h1>'
  @name = 'joe'
  @show_description = true
  
  erb :index
end

post '/twitter' do
  @first_hash = params[:first_hash]
  @second_hash = params[:second_hash]
  "<p>Your posts #{@first_hash} and #{@second_hash} were submitted</p>"
  # params.inspect

end

# get '/twitter' do
#   puts "Your posts #{@first_hash} and #{@second_hash} was submitted"
# end

# request.POST.inspect