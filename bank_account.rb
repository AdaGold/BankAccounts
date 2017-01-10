require_relative 'account'
require_relative 'owner'

require 'csv'

def self.all
  bank_accounts = []
  CSV.read("./support/account_owners.csv").each do |line|
    bank_hash = {}
    bank_hash[:bank_id] = line[0].to_i
    bank_hash[:owner_id] = line[1].to_i
    bank_accounts << bank_hash
  end
  return bank_accounts
end

name = self.all
puts name

# And now, magic happens and I somehow link the owner with the account.
