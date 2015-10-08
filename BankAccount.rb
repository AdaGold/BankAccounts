#
# module Bank
#   require cvs
#   class Account
#     def initialize(user_number,balance_number)
#       if balance_number < 0
#         raise ArgumentError
#       end
#       end
#       @balance = balance_number
#       @id = user_number
#     end
#     def withdraw(amount_of_withdraw)
#       if amount_of_withdraw > @balance
#         puts "overdraft"
#         return @balance
#       end
#       @balance = @balance - amount_of_withdraw
#       return @balance
#     end
#     def deposit(amount_of_deposit)
#       @balance = @balance + amount_of_deposit
#       return @balance
#     end
#     attr_reader :id, :balance, :owner, :open_date
#
#
#   end
# end
#
# a = Bank::Account::.new


require 'csv'
module Bank
  class Account

attr_reader :Id, :balance, :open_date

    def initialize(id, balance, open_date)
      if balance_number < 0
        raise ArgumentError
      end
      @balance = balance_number
      @id = user_number
      @open_date = open_date
    end


def Account.all
  accounts_csv = CSV.read("./supports/accounts.csv")
  #account_owner = Account.new(accounts_csv[0][0],accounts_csv[0][1], accounts_csv[0][3])
  return accounts_csv.map do |row|
    id = row[0].to_i
    balance = row[1].to_i
    open_date = DateTime.parse(row[2])
    Account.new(id, balance, open_date)
  end

end


def self.find(id)
  Account.all.find do |n|
    n == id
  end
end

accounts_csv = CSV.read("./supports/accounts.csv")
  accounts_csv.each do |row|
    if row[0] == id
      puts row
    end
end
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
