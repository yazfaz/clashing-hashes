require_relative "../lib/follower_clash"

describe FollowerClash::Comparer do 
  
  describe "#compare" do
    context "when user 1 has more followers" do
      it "should return user1" do
        user1 = double("user1")
        user2 = double("user2")

        allow(user1).to receive(:followers).and_return(10)
        allow(user2).to receive(:followers).and_return(1)

        expect(FollowerClash::Comparer.new(user1,user2).compare).to eq(user1)
      end
    end
  
    context "when user1 and user2 have the same number of followers" do 
      it "should return a message that both user are the same" do 
        user1 = double("user1")
        user2 = double("user2")

        allow(user1).to receive(:followers).and_return(10)
        allow(user2).to receive(:followers).and_return(10)

        expect(FollowerClash::Comparer.new(user1,user2).compare).to eq('Both users have the same number of followers')
      end
    end

  end
end

describe FollowerClash::User do 
  
  describe '#followers' do 
    it 'returns the number of followers from the Twitter API' do 
      Twitter::Client.stub_chain(:new, :configure, :user, :followers_count).and_return(20)

      expect(FollowerClash:User.new('ornellasmike').followers).to eq(20)
    end
  end
end

