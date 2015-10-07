# Bank Accounts

We will be working with the concept of bank accounts in order to explore more object-oriented code as well as a few other new topics.

## Baseline Setup

1. This is an individual project.
1. Clone the project master repo and create a new branch with your initials.
1. Push your branch so it will show in the list of branches on the project master.
1. Fork the project master.
1. Clone the forked repo: `$ git clone [YOUR FORKED REPO URL]`
1. Switch to your branch by doing `git checkout [YOUR BRANCH NAME]`. *Do not work on the master branch*.
1. `cd` into the dir create:d `$ cd BankAccounts`
1. Run `git status` to verify the branch you are on
1. Run `git remote -v` to verify the folder you are in corresponds to the fork you have created.


## Wave 1

Create a `Bank` module which will contain your `Account` class and any future bank account logic.

Create an `Account` class which should have the following functionality:
- A new account should be created with an ID and an initial balance
- Should have a `withdraw` method that accepts a single parameter which represents the amount of money that will be withdrawn. This method should return the updated account balance.
- Should have a `deposit` method that accepts a single parameter which represents the amount of money that will be deposited. This method should return the updated account balance.
- Should be able to access the current `balance` of an account at any time.

### Error handling
- A new account cannot be created with initial negative balance - this will `raise` an `ArgumentError` (Google this)
- The `withdraw` method does not allow the account to go negative - Will output a warning message and return the original un-modified balance

#### Optional:
- Create an `Owner` class which will store information about those who own the `Accounts`.
  - This should have info like name and address and any other identifying information that an account owner would have.
- Add an `owner` property to each Account to track information about who owns the account.
  - The `Account` can be created with an `owner`, OR you can create a method that will add the `owner` after the `Account` has already been created.


## Wave 2
### CSV Files!
- Update the `Account` class to be able to handle all of these fields from the CSV file used as input.
  - For example, manually choose the data from the first line of the CSV file and ensure you can create a new instance of your Account using that data
- Add the following **class** methods to your existing `Account` class
  - `self.all` - returns a collection of `Account` instances, representing all of the Accounts described in the CSV. See below for the CSV file specifications
  - `self.find(id)` - returns an instance of `Account` where the value of the id field in the CSV matches the passed parameter


#### CSV Data File
  Bank::Account

  The data, in order in the CSV, consists of:  
  **ID** - (Fixnum) a unique identifier for that Account  
  **Balance** - (Fixnum) the account balance amount, in cents (i.e., 150 would be $1.50)  
  **OpenDate** - (Datetime) when the account was opened  

#### Optional:
  - Implement the optional requirement from Wave 1
  - Add the following **class** methods to your existing `Owner` class
    - `self.all` - returns a collection of `Owner` instances, representing all of the Owners described in the CSV. See below for the CSV file specifications
    - `self.find(id)` - returns an instance of `Owner` where the value of the id field in the CSV matches the passed parameter

    Bank::Owner  
    The data, in order in the CSV, consists of:  
    **ID** - (Fixnum) a unique identifier for that Owner  
    **Last Name** - (String) the owner's last name   
    **First Name** - (String) the owner's first name  
    **Street Addess** - (String) the owner's street address  
    **City** - (String) the owner's city  
    **State** - (String) the owner's state  

    To create the relationship between the accounts and the owners use the `account_owners` CSV file.
    The data for this file, in order in the CSV, consists of:
    **Account ID** - (Fixnum) a unique identifier corresponding to an account
    **Owner ID** - (Fixnum) a unique identifier corresponding to an owner

<!--
## Wave 3
Create a `SavingsAccount` class which should inherit behavior from the `Account` class. It should include updated logic with the following functionality:
- An updated `initialize` method:
  - The initial balance cannot be less than $10. If it is, this will `raise` an `ArgumentError`
- An updated `withdraw` method:
  - Each withdrawal 'transaction' incurs a fee of $2 that is taken out of the balance.
  - Does not allow the account to go below the $10 minimum balance - Will output a warning message and return the original un-modified balance

It should include the following new methods:
- `#add_interest(rate)`: Calculate the interest on the balance and add the interest to the balance. Return the **interest** that was calculated and added to the balance (not the updated balance).
  - Input rate is assumed to be a percentage (i.e. 0.25).
  - The formula for calculating interest is `balance * rate/100`
    - Example: If the interest rate is 0.25% and the balance is $10,000, then the interest that is returned is $25 and the new balance becomes $10,025.

Create a `CheckingAccount` class which should inherit behavior from the `Account` class. It should include updated logic with the following functionality:
- `#withdraw(amount)`: The input amount gets taken out of the account as result of an ATM transaction. Each withdrawal 'transaction' incurs a fee of $1 that is taken out of the balance. Returns the updated account balance.
  - Does not allow the account to go negative. Will output a warning message and return the original un-modified balance.
- `#withdraw_using_check(amount)`: The input amount gets taken out of the account as a result of a check withdrawal. Returns the updated account balance.
  - Allows the account to go into overdraft up to -$10 but not any lower
  - The user is allowed three free check uses in one month, but any subsequent use adds a $2 transaction fee
- `#reset_checks`: Resets the number of checks used to zero




## Optional:

Create a `MoneyMarketAccount` class with a minimum of 6 specs. The class should inherit behavior from the `Account` class.
- A maximum of 6 transactions (deposits or withdrawals) are allowed per month on this account type
- `self.new(id, initial_balance)`: creates a new instance with the instance variable `id` and 'initial_balance' assigned
  - The initial balance cannot be less than $10,000 - this will `raise` an `ArgumentError`
- `#withdraw(amount)`: The input amount gets taken out of the account as result of an ATM transaction. Returns the updated account balance.
  - If a withdrawal causes the balance to go below $10,000, a fee of $100 is imposed and no more transactions are allowed until the balance is increased using a deposit transaction.
  - Each transaction will be counted against the maximum number of transactions
- `#deposit(amount)`. Returns the updated account balance.
  - Each transaction will be counted against the maximum number of transactions
  - Exception to the above: A deposit performed to reach or exceed the minimum balance of $10,000 is not counted as part of the 6 transactions.
- `#add_interest(rate)`: Calculate the interest on the balance and add the interest to the balance. Return the interest that was calculated and added to the balance (not the updated balance). Note** This is the same as the `SavingsAccount` interest.
- `#reset_transactions`: Resets the number of transactions to zero
-->
