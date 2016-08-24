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
      @id = rand(111111..999999)
    end

    # The user inputs how much money to withdraw. If the withdraw amount is greater
    # than the balance, the user is given a warning and not allowed to withdraw
    # that amount. Otherwise, the balance is adjusted and returned.
    def withdraw_money(withdraw_amount)
      if (@balance - withdraw_amount) < 0
        puts "I'm sorry, you cannot withdraw that amount, as you do not have enough money in your account."
      else
        @balance -= withdraw_amount
      end
      return @balance
    end

    # The user inputs how much is to be deposited and the balance reflects that
    # deposit
    def deposit_money(deposit_amount)
      @balance += deposit_amount
      return @balance
    end

    # The current balance can be accessed at any time.
    def access_balance
      return @balance
    end

    # Returns a collection of Account instances, representing all of the
    # Accounts described in the CSV.
    def self.all
      accounts = []
      CSV.read("./support/accounts.csv").each do |line|
        account_hash = {}
        account_hash[:id] = line[0]
        account_hash[:balance] = line[1].to_f/100
        account_hash[:creation_time] = line[2]
        accounts << Bank::Account.new(account_hash)
      end
      return accounts
    end

    # Returns an instance of Account where the value of the id field
    # in the CSV matches the passed parameter; will have to use self.all
    def self.find(id)
      self.all
      accounts.each do |input|
        if account_hash[:id] == input
          return "#{account_hash[:id]}: #{account_hash[:balance]} created at #{account_hash[:creation_time]}."
        end
      end
    end
  end
end

bank_branch = Bank::Account.all
puts bank_branch

puts self.find(1212)
#
# bank_branch.each do |a|
#   puts a.balance
# end

# Update the Account class to be able to handle all of these fields from the
# CSV file used as input.
# For example, manually choose the data from the first line of the CSV file
# and ensure you can create a new instance of your Account using that data


# CSV Data File
#
# Bank::Account
#
# The data, in order in the CSV, consists of:
# ID - (Fixnum) a unique identifier for that Account
# Balance - (Fixnum) the account balance amount, in cents (i.e., 150 would be $1.50)
# OpenDate - (Datetime) when the account was opened
#
#
