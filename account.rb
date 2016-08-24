#require_relative 'owner'
require 'csv'

module Bank
  class Account
    attr_accessor
    attr_reader :balance, :id, :creation_time
    attr_writer

    def initialize(account_hash)
      @balance = account_hash[:balance]
      @id = account_hash[:id]
      @creation_time = account_hash[:creation_time]
      create_account(account_hash[:balance])
    end

    def negative_initial
      begin
        raise ArgumentError
      rescue
        puts "The initial balance cannot be negative. Please enter a positive number."
        @balance = gets.chomp.to_f
      end
    end

    # Creates a new account should be created with an ID and an initial balance
    def create_account(balance)
      @balance = balance/100
      while @balance < 0.0
        negative_initial
      end
    end

    # The user inputs how much money to withdraw. If the withdraw amount is greater
    # than the balance, the user is given a warning and not allowed to withdraw
    # that amount. Otherwise, the balance is adjusted and returned.
    def withdraw(amount)
      if (@balance - amount) < 0
        puts "I'm sorry, you cannot withdraw that amount, as you do not have enough money in your account."
      else
        @balance -= amount
      end
      return @balance
    end

    # The user inputs how much is to be deposited and the balance reflects that
    # deposit
    def deposit(amount)
      @balance += amount
      return @balance
    end

    # The current balance can be accessed at any time.
    def balance
      return @balance
    end

    # Returns a collection of Account instances, representing all of the
    # Accounts described in the CSV.
    def self.all
      accounts = []
      CSV.read("./support/accounts.csv").each do |line|
        account_hash = {}
        account_hash[:id] = line[0].to_i
        account_hash[:balance] = line[1].to_f
        account_hash[:creation_time] = line[2]
        accounts << Bank::Account.new(account_hash)
      end
      return accounts
    end

    # Returns an instance of Account where the value of the id field
    # in the CSV matches the passed parameter; will have to use self.all
    def self.find(input)
      account = self.all
      account.each do |var|
        if var.id == input
          puts var.print_props
          return var
        end
      end
      return nil
    end

    def print_props
      return "Account ID #{ @id } has a balance of $" + sprintf("%0.02f", @balance) + " and was created at #{ @creation_time }"
    end
  end
end

# bank_branch = Bank::Account.all
# puts bank_branch

b = Bank::Account.find(1212)
puts b


# bank_branch.each do |a|
#   puts a.balance
# end
