require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'twitter'

get '/' do
  # '<h1>hello joe and yasmin</h1>'
  @name = 'joe'
  @show_description = true
  
  erb :index
end

post '/twitter' do
  @first_hash = params[:first_hash]
  @second_hash = params[:second_hash]
  
  # Require twitter module; create empty tweets array; based off Tweet class in Twitter module, make tweets, push in array. Then in html twitter_results.erb, display array
  @tweets = []
  tweet1 = Twitter::Tweet.new("yazfaz", "ready for b12")
  @tweets << tweet1
  erb :twitter_results

end

# get '/twitter' do
#   puts "Your posts #{@first_hash} and #{@second_hash} was submitted"
# erb:index
# end

# request.POST.inspect

# http://surrealdetective.github.io/blog/2013/07/01/the-nested-ruby-params-hash-for-complex-html-forms-and-sinatra/