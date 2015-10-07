module Bank
  class Account
    def initialize(user_number,balance_number)
      if balance_number < 0
        raise ArgumentError
      end
      @balance = balance_number
      @id = user_number
    end
    def withdraw(amount_of_withdraw)
      if amount_of_withdraw > @balance
        puts "overdraft"
        return @balance
      end
      @balance = @balance - amount_of_withdraw
      return @balance
    end
    def deposit(amount_of_deposit)
      @balance = @balance + amount_of_deposit
      return @balance
    end
    attr_reader :id, :balance


  end

end
