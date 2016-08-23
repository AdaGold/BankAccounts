module Bank
  class Account
    attr_accessor :withdraw_amount, :deposit_amount
    attr_reader :balance, :id, :initial_balance
    attr_writer

    def initialize
      @balance = balance
      @id = id
      @initial_balance = initial_balance
      @withdraw_amount = withdraw_amount
      @deposit_amount = deposit_amount
    end

    # A new account should be created with an ID and an initial balance
    # A new account cannot be created with initial negative balance -
    # this will raise an ArgumentError (Google this)
    def create_account


    end

    # Should have a withdraw method that accepts a single parameter
    # which represents the amount of money that will be withdrawn.
    # This method should return the updated account balance.
    # The withdraw method does not allow the account to go negative -
    # Will output a warning message and return the original un-modified balance
    def withdraw_money


    end

    # Should have a deposit method that accepts a single parameter which
    # represents the amount of money that will be deposited. This method
    # should return the updated account balance.
    def deposit_money



    end

    # Should be able to access the current balance of an account at any time.
    def access_balance
      return @balance
    end
  end
end
