# require_relative 'account'
require 'csv'

module Bank
  class Owner
    attr_accessor
    attr_reader :id, :first_name, :last_name, :street_address, :city, :state
    attr_writer

    def initialize(owner_hash)
      @id = owner_hash[:id]
      @first_name = owner_hash[:first_name]
      @last_name = owner_hash[:last_name]
      @street_address = owner_hash[:street_address]
      @city = owner_hash[:city]
      @state = owner_hash[:state]
    end

    def create_owner
      puts "What is your first name?"
      @owner[:first_name] = gets.chomp
      puts "What is your last name?"
      @owner[:last_name] = gets.chomp
      puts "What is your street address?"
      @owner[:street_address] = gets.chomp
      puts "In what city do you live?"
      @owner[:city] = gets.chomp
      puts "In what state do you live?"
      @owner[:state] = gets.chomp
      @owners << @owner
    end

    def self.all
      owners = []
      CSV.read("./support/owners.csv").each do |line|
        owner_hash = {}
        owner_hash[:id] = line[0].to_i
        owner_hash[:last_name] = line[1]
        owner_hash[:first_name] = line[2]
        owner_hash[:street_address] = line[3]
        owner_hash[:city] = line[4]
        owner_hash[:state] = line[5]
        owners << Bank::Owner.new(owner_hash)
      end
      return owners
    end

    # Returns an instance of Account where the value of the id field
    # in the CSV matches the passed parameter; will have to use self.all
    def self.find(input)
      account_owner = self.all
      account_owner.each do |var|
        if var.id == input
          puts var.print_props
          return var
        end
      end
    end

    def print_props
      return "Account ID #{ @id } belongs to #{ @first_name } #{ @last_name } whose address is #{ @street_address }, #{ @city }, #{ @state }."
    end
  end
end

# account_owners = Bank::Owner.all
# puts account_owners
#
# o = Bank::Owner.find(20)
# puts o
