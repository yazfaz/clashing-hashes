require 'rubygems'
require 'bundler/setup'
require 'twitter'


module FollowerClash
  class User
    attr_reader :login
    
    def initialize(login)
      @login = login
    end

    # These values are kept secret due to Foreman; stored in .env file. They aren't made public to github.
    def followers
      client = Twitter::Client.new.configure do |config|
        config.consumer_key = ENV['CONSUMER_KEY']
        config.consumer_secret = ENV['CONSUMER_SECRET']
        config.oauth_token = ENV['OAUTH_TOKEN']
        config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
      end

      client.user(@login).followers_count
    end
  end

  class Comparer

    def initialize(user1,user2)
      @user1 = user1
      @user2 = user2
    end

    # Compare the number of followers for each user; followers comes from the followers method in User class. Then display the user's login and number of followers for that user. 
    def compare
      if @user1.followers > @user2.followers
        @user1.login "who has " @user1.followers
      elsif @user2.followers > @user1.followers
        @user2.login "who has " @user2.followers 
      elsif @user1.followers == @user2.followers
        "Both users have the same number of followers." 
      end
    end
  
  end

end