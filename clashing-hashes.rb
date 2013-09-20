require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'twitter'
require_relative 'lib/follower_clash'

get '/' do
  # '<h1>hello joe and yasmin</h1>'
  @name = 'joe'
  @show_description = true
  
  erb :index
end

post '/twitter' do
  @first_hash = params[:first_hash]
  @second_hash = params[:second_hash]
  @user1 = FollowerClash::User.new(params[:first_hash])
  @user2 = FollowerClash::User.new(params[:second_hash])
  @result = FollowerClash::Comparer.new(@user1,@user2).compare
  

  #Extension: Require twitter module; create empty tweets array; based off Tweet class in Twitter module, make tweets, push in array. Then in html twitter_results.erb, display array
  # @tweets= Twitter::Tweet::give_me_tweets(number)
  # @tweets = [t]
  # t = Twitter::Tweet.new("ready for b12", "yazfaz")
  # t2 = Twitter::Tweet.new("ready for more b12", "yazfaz")
  # @tweets << tweet1
  erb :twitter_results

end

# get '/twitter' do
#   puts "Your posts #{@first_hash} and #{@second_hash} was submitted"
# erb:index
# end

# request.POST.inspect

# http://surrealdetective.github.io/blog/2013/07/01/the-nested-ruby-params-hash-for-complex-html-forms-and-sinatra/