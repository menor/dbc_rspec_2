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
    it "should increase the balance" do
      old_balance = account.balance
      account.deposit!(1000)
      old_balance.should be < account.balance
    end

    it 'should raise an error for negative amounts' do
      expect{ account.deposit!(-1) }.to raise_error(NegativeDepositError)
    end
  end

  describe "#withdraw!" do
    it 'should decrease the balance' do
      account.deposit!(5)
      old_balance = account.balance
      account.withdraw!(1)
      account.balance.should be < old_balance
    end

    it 'should raise and error for negative balances' do
      expect{ account.withdraw!(1) }.to raise_error(OverdraftError)
    end

  end

end
