require_relative 'owner'

module Bank
  class Account
    attr_accessor :withdraw_amount, :deposit_amount
    attr_reader :balance, :id, :initial_balance, :name
    attr_writer

    def initialize
      @balance = balance
      @id = id
      @initial_balance = initial_balance
      @withdraw_amount = withdraw_amount
      @deposit_amount = deposit_amount
      @name = name
      @owners = []
    end

    def negative_initial
      begin
        raise ArgumentError
      rescue
        puts "The initial balance cannot be negative. Please enter a positive number."
        @initial_balance = gets.chomp.to_f
      end
    end

    # Creates a new account should be created with an ID and an initial balance
    def create_account
      create_owner
      puts "What is your initial balance?"
      @initial_balance = gets.chomp.to_f
      while @initial_balance < 0.0
        negative_initial
      end
      @balance = @initial_balance
      @id = rand(111111..999999)
    end

    # The user inputs how much money to withdraw. If the withdraw amount is greater
    # than the balance, the user is given a warning and not allowed to withdraw
    # that amount. Otherwise, the balance is adjusted and returned.
    def withdraw_money
      puts "How much would you like to withdraw?"
      @withdraw_amount = gets.chomp.to_f
      if (@balance - @withdraw_amount) < 0
        puts "I'm sorry, you cannot withdraw that amount, as you do not have enough money in your account."
      else
        @balance -= @withdraw_amount
      end
      return @balance
    end

    # The user inputs how much is to be deposited and the balance reflects that
    # deposit
    def deposit_money
      puts "How much would you like to deposit?"
      @deposit_amount = gets.chomp.to_f
      @balance += @deposit_amount
      return @balance
    end

    # The current balance can be accessed at any time.
    def access_balance
      return @balance
    end
  end
end
