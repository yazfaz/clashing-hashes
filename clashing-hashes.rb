require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'twitter'
require_relative 'lib/follower_clash'

get '/' do
  
  erb :index
end

# The params[:first_login] refers to the input form in index.html. So by calling it here, we get the user's login (value passed into form). Here, setting @user1 to a new user with login at params[:first_login]
post '/twitter' do
  @user1 = FollowerClash::User.new(params[:first_hash])
  @user2 = FollowerClash::User.new(params[:second_hash])
  @result = FollowerClash::Comparer.new(@user1,@user2).compare
  
  erb :twitter_results

end