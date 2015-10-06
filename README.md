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
