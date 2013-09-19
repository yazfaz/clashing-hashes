module Clashing
  module Twitter
    
    class Tweet
     attr_accessor :status, :author
     
     def initialize(status, author)
      @status = status
      @author = author
     end 

     def self.give_me_tweets(number)
        tweets = []
      number.times do |x|
        tweets << Tweet.new("My status #{x}", "My Author #{x}")
        end
        tweets
      end
   
    end
  end
end