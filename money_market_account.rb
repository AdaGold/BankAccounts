require_relative 'account.rb'
require 'csv'

module Bank
  class MoneyMarketAccount < Account
    attr_accessor :balance, :interest, :number_of_transactions

    def initialize()
      super
      @balance = balance
      @interest = interest
      @number_of_transactions = 0
    end

    def create_account(balance)
      @balance = balance.to_f/100
      while @balance < 10000.0
        negative_initial
      end
      return @balance
    end

    def withdraw(dollar_amount)
      # A maximum of 6 transactions (deposits or withdrawals) are allowed per month on this
      # account type
      if @number_of_transactions > 6
        puts "I'm sorry, you have exceeded the maximum number of transactions for this month."
      else
        if (@balance - dollar_amount) < 10000.0
          puts "That withdraw has caused your account to drop below $10,000. You have been charged a $100 fee and must make a deposit prior to another withdrawal."
          @balance -= (@balance - dollar_amount - 100)
        else
          @balance -= (dollar_amount)
        end
        @number_of_transactions += 1
      end
      return @balance
    end

    def deposit(dollar_amount)
      # A deposit performed to reach or exceed the minimum balance # of $10,000 is not
      # counted as part of the 6 maximum transactions.
      if @balance < 10000
        @balance += dollar_amount
      # A maximum of 6 transactions (deposits or withdrawals) are allowed per month on this
      # account type
      elsif @number_of_transactions > 6
        puts "I'm sorry, you have exceeded the maximum number of transactions for this month."
      else
        @balance += dollar_amount
        @number_of_transactions += 1
      end
      return @balance
    end

    def add_interest(rate)
      @interest = @balance * (rate/100)
      return @interest
    end

    def reset_transactions
      @number_of_transactions = 0
      return @number_of_transactions
    end
  end
end

money = Bank::MoneyMarketAccount.new
money.create_account(1098000)
puts money.balance
money.withdraw(10000)
puts money.balance
money.deposit(5000)
puts money.balance
money.add_interest(0.50)
puts money.balance
money.withdraw(10000)
puts money.balance
money.deposit(5000)
puts money.balance
money.add_interest(0.75)
puts money.balance
money.withdraw(10000)
puts money.balance
money.deposit(5000)
puts money.balance
money.add_interest(1.00)
puts money.balance
money.withdraw(10000)
puts money.balance
money.deposit(5000)
puts money.balance
