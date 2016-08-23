require_relative 'account'

module Bank
  class Owner
    attr_accessor
    attr_reader :first_name, :last_name, :street_address, :city, :state, :zip_code
    attr_writer

    def initialize
      @first_name = first_name
      @last_name = last_name
      @street_address = street_address
      @city = city
      @state = state
      @zip_code = zip_code
    end




  end
end


# Add an owner property to each Account to track information about who owns the account.
# The Account can be created with an owner, OR you can create a method that will add
# the owner after the Account has already been created.
