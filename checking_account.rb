require_relative 'account.rb'

module Bank
  class CheckingAccount < Account
    attr_accessor :number_of_checks, :balance

    def initialize
      super
      @number_of_checks = number_of_checks
      @balance = balance
    end

    def withdraw(dollar_amount)
      if (@balance - dollar_amount - 1) < 0.0
        puts "I'm sorry, you cannot withdraw that amount, as you do not have enough money in your account."
      else
        @balance -= (dollar_amount + 1)
      end
      return @balance
    end

    def withdraw_using_check(dollar_amount)
      number_of_checks = 0
      # The user is allowed three free check uses in one month, but any subsequent use adds
      # a $2 transaction fee
      if number_of_checks <= 3
        # Allows the account to go into overdraft up to -$10 but not any lower
        if (@balance - dollar_amount) < -10.0
          puts "I'm sorry, you cannot withdraw that amount, as you do not have enough money in your account."
        else
          @balance -= (dollar_amount)
        end
      else
        if (@balance - dollar_amount - 2) < -10.0
          puts "I'm sorry, you cannot withdraw that amount, as you do not have enough money in your account."
        else
          @balance -= (dollar_amount + 2)
        end
        return @balance
      end
    end

    def reset_checks
      @number_of_checks = 0
      return @number_of_checks
    end
  end
end

check = Bank::CheckingAccount.new
check.create_account(1098)
puts check.balance
check.withdraw_using_check(10)
puts check.balance
check.withdraw_using_check(7)
puts check.balance
check.withdraw_using_check(7)
puts check.balance
