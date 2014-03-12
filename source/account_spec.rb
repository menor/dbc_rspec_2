require "rspec"

require_relative "account"

describe Account do

  let(:account) {Account.new("1234567890")}
  
  context "#initialize" do
    it "creates a new account" do
      account.should be_an_instance_of Account
    end

    it "requires one parameter" do
      expect { Account.new }.to raise_error(ArgumentError)
    end
  end

  context "#transactions" do
    it "should return the starting balance" do
      account.balance.should eq 0    
    end
  end

  describe "#balance" do
    it 'should be 0 for a new account' do
      account.balance.should eq 0
    end

    it "should change after some deposits" do
      account.deposit!(15)
      account.deposit!(50)
      account.balance.should eq 65
    end
  end

  describe "#account_number" do
    it 'should return ******7890' do
      account.acct_number.should eq '******7890'
    end
  end

  describe "deposit!" do

  end

  describe "#withdraw!" do

  end

end

# What are the valid inputs, if any, for this method?
# An account number.
# What constitutes expected return values?
# 
# What constitutes unexpected return values?
# Does the method cause changes to the state of the program?
# What defines a happy path scenario? What about a sad path?