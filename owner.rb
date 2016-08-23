require_relative 'account'

module Bank
  class Owner
    attr_accessor
    attr_reader :first_name, :last_name, :street_address, :city, :state, :zip_code
    attr_writer

    def initialize
      @owners = []
      @first_name = first_name
      @last_name = last_name
      @street_address = street_address
      @city = city
      @state = state
      @zip_code = zip_code
    end

    def create_owner
      puts "What is your first name?"
      @first_name = gets.chomp
      puts "What is your last name?"
      @last_name = gets.chomp
      puts "What is your street address?"
      @street_address = gets.chomp
      puts "In what city do you live?"
      @city = gets.chomp
      puts "In what state do you live?"
      @state = gets.chomp
      puts "What is your zip code?"
      @zip_code = gets.chomp
      @owners << owner
    end
  end
end
