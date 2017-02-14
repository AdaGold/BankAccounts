require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/bank_accounts'

describe "Wave 1" do
  describe "Account#initialize" do
    it "Takes an ID and an initial balance" do
      id = 1337
      balance = 100.0
      account = Account.new(id, balance)

      account.must_respond_to :id
      account.id.must_equal id

      account.must_respond_to :balance
      account.balance.must_equal balance
    end

    it "Raises an ArgumentError when created with a negative balance" do
      # Note: we haven't talked about procs yet. You can think
      # of them like blocks that sit by themselves.
      # This code checks that, when the proc is executed, it
      # raises an ArgumentError.
      proc {
        Account.new(1337, -100.0)
      }.must_raise ArgumentError
    end

    it "Can be made with a balance of 0" do
      # If this raises, the test will fail. No 'must's needed!
      Account.new(1337, 0)
    end
  end

  describe "Account#withdraw" do
    it "Reduces the balance" do
    end

    it "Returns the modified balance" do
    end

    it "Outputs a warning if the account would go negative" do
    end

    it "Doesn't modify the balance if the account would go negative" do
    end
  end

  describe "Account#deposit" do
    it "Increases the balance" do
    end

    it "Returns the modified balance" do
    end
  end
end

# TODO: change 'xdescribe' to 'describe' to run these tests
xdescribe "Wave 2" do
  describe "Account.all" do
    it "Returns all accounts" do
      # TODO: Your test code here!
    end
  end

  describe "Account.find" do
    it "Returns an account that exists" do
      # TODO: Your test code here!
    end

    it "Throws an error for an account that doesn't exist" do
      # TODO: Your test code here!
    end
  end
end

xdescribe "Wave 3" do
  describe "SavingsAccount" do
    it "Is a kind of Account" do
      account = SavingsAccount.new(12345, 100.0)
      account.must_be_kind_of Account
    end
  end

  describe "CheckingAccount" do
    it "Is a kind of Account" do
      account = CheckingAccount.new(12345, 100.0)
      account.must_be_kind_of Account
    end
  end
end
