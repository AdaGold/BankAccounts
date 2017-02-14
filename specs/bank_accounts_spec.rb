require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative '../lib/bank_accounts'

describe "Wave 1" do
  describe "Account#initialize" do
    it "Takes an ID and an initial balance" do
      id = 1337
      balance = 100.0
      account = Bank::Account.new(id, balance)

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
        Bank::Account.new(1337, -100.0)
      }.must_raise ArgumentError
    end

    it "Can be created with a balance of 0" do
      # If this raises, the test will fail. No 'must's needed!
      Bank::Account.new(1337, 0)
    end
  end

  describe "Account#withdraw" do
    it "Reduces the balance" do
      start_balance = 100.0
      withdrawal_amount = 25.0
      account = Bank::Account.new(1337, start_balance)

      account.withdraw(withdrawal_amount)

      expected_balance = start_balance - withdrawal_amount
      account.balance.must_equal expected_balance
    end

    it "Returns the modified balance" do
      start_balance = 100.0
      withdrawal_amount = 25.0
      account = Bank::Account.new(1337, start_balance)

      updated_balance = account.withdraw(withdrawal_amount)

      expected_balance = start_balance - withdrawal_amount
      updated_balance.must_equal expected_balance
    end

    it "Outputs a warning if the account would go negative" do
      start_balance = 100.0
      withdrawal_amount = 200.0
      account = Bank::Account.new(1337, start_balance)

      # Another proc! This test expects something to be printed
      # to the terminal, using 'must_output'. /.+/ is a regular
      # expression matching one or more characters - as long as
      # anything at all is printed out the test will pass.
      proc {
        account.withdraw(withdrawal_amount)
      }.must_output /.+/
    end

    it "Doesn't modify the balance if the account would go negative" do
      start_balance = 100.0
      withdrawal_amount = 200.0
      account = Bank::Account.new(1337, start_balance)

      updated_balance = account.withdraw(withdrawal_amount)

      # Both the value returned and the balance in the account
      # must be un-modified.
      updated_balance.must_equal start_balance
      account.balance.must_equal start_balance
    end

    it "Allows the balance to go to 0" do
      account = Bank::Account.new(1337, 100.0)
      updated_balance = account.withdraw(account.balance)
      updated_balance.must_equal 0
      account.balance.must_equal 0
    end

    it "Requires a positive withdrawal amount" do
      start_balance = 100.0
      withdrawal_amount = -25.0
      account = Bank::Account.new(1337, start_balance)

      proc {
        account.withdraw(withdrawal_amount)
      }.must_raise ArgumentError
    end
  end

  describe "Account#deposit" do
    it "Increases the balance" do
      start_balance = 100.0
      deposit_amount = 25.0
      account = Bank::Account.new(1337, start_balance)

      account.deposit(deposit_amount)

      expected_balance = start_balance + deposit_amount
      account.balance.must_equal expected_balance
    end

    it "Returns the modified balance" do
      start_balance = 100.0
      deposit_amount = 25.0
      account = Bank::Account.new(1337, start_balance)

      updated_balance = account.deposit(deposit_amount)

      expected_balance = start_balance + deposit_amount
      updated_balance.must_equal expected_balance
    end

    it "Requires a positive deposit amount" do
      start_balance = 100.0
      deposit_amount = -25.0
      account = Bank::Account.new(1337, start_balance)

      proc {
        account.deposit(deposit_amount)
      }.must_raise ArgumentError
    end
  end
end

# TODO: change 'xdescribe' to 'describe' to run these tests
xdescribe "Wave 2" do
  describe "Account.all" do
    it "Returns an array of all accounts" do
      # TODO: Your test code here!
      # Useful checks might include:
      #   - Account.all returns an array
      #   - Everything in the array is an Account
      #   - The number of accounts is correct
      #   - The ID and balance of the first and last
      #       accounts match what's in the CSV file
      # Feel free to split this into multiple tests if needed
    end
  end

  describe "Account.find" do
    it "Returns an account that exists" do
      # TODO: Your test code here!
    end

    it "Raises an error for an account that doesn't exist" do
      # TODO: Your test code here!
    end
  end
end

xdescribe "Wave 3" do
  # Because a SavingsAccount and CheckingAccount are both kinds
  # of Account, and we've already tested a bunch of functionality
  # on Account, we effectively get all that testing for free!
  # Here we'll only test things that are different.
  describe "SavingsAccount" do
    describe "#initialize" do
      it "Is a kind of Account" do
        # Check that a SavingsAccount is in fact a kind of account
        account = Bank::SavingsAccount.new(12345, 100.0)
        account.must_be_kind_of Bank::Account
      end

      it "Requires an initial balance of at least $10" do
        # TODO: Your test code here!
      end
    end

    describe "#withdraw" do
      it "Applies a $2 fee each time" do
        # TODO: Your test code here!
      end

      it "Outputs a warning if the balance would go below $10" do
        # TODO: Your test code here!
      end

      it "Doesn't modify the balance if it would go below $10" do
        # TODO: Your test code here!
      end

      it "Doesn't modify the balance if the fee would put it below $10" do
        # TODO: Your test code here!
      end
    end

    describe "#add_interest" do
      it "Returns the interest calculated" do
        # TODO: Your test code here!
      end

      it "Updates the balance with calculated interest" do
        # TODO: Your test code here!
      end

      it "Requires a positive rate" do
        # TODO: Your test code here!
      end
    end
  end

  describe "CheckingAccount" do
    describe "#initialize" do
      # Check that a CheckingAccount is in fact a kind of account
      it "Is a kind of Account" do
        account = Bank::CheckingAccount.new(12345, 100.0)
        account.must_be_kind_of Bank::Account
      end
    end

    describe "#withdraw" do
      it "Applies a $1 fee each time" do
        # TODO: Your test code here!
      end

      it "Doesn't modify the balance if the fee would put it negative" do
        # TODO: Your test code here!
      end
    end

    describe "#withdraw_using_check" do
      it "Reduces the balance" do
        # TODO: Your test code here!
      end

      it "Returns the modified balance" do
        # TODO: Your test code here!
      end

      it "Allows the balance to go down to -$10" do
        # TODO: Your test code here!
      end

      it "Outputs a warning if the account would go below -$10" do
        # TODO: Your test code here!
      end

      it "Doesn't modify the balance if the account would go below -$10" do
        # TODO: Your test code here!
      end

      it "Requires a positive withdrawal amount" do
        # TODO: Your test code here!
      end

      it "Allows 3 free uses" do
        # TODO: Your test code here!
      end

      it "Applies a $2 fee after the third use" do
        # TODO: Your test code here!
      end
    end

    describe "#reset_checks" do
      it "Can be called without error" do
        # TODO: Your test code here!
      end

      it "Makes the next three checks free if less than 3 checks had been used" do
        # TODO: Your test code here!
      end

      it "Makes the next three checks free if more than 3 checks had been used" do
        # TODO: Your test code here!
      end
    end
  end
end
