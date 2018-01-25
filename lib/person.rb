require 'pry'

require './lib/account.rb'
require './lib/person.rb'

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @cash = 1000
    @account = nil
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(value)
    @account == nil ? missing_account : deposit_funds(value)
  end

  def withdraw(args = {})
    @account == nil ? missing_account : withdraw_funds(args)
  end

  private

  def deposit_funds(value)
    if @cash >= value
      @cash -= value
      @account.balance += value
    else
      insufficient_cash
    end
  end

  def withdraw_funds(args)
     args[:atm] == nil ? missing_atm : atm = args[:atm]
     account = @account
     amount = args[:amount]
     pin_code = args[:pin]
     exp_date = args[:exp_date]
     #IS THIS REALLY HOW WE DO THIS???? =)
     #binding.pry
     response = atm.withdraw(amount, pin_code, account)
     response[:status] ? increase_cash(response) : response
   end

   def increase_cash(response)
    @cash += response[:amount]
   end

   def set_name(name)
     name == nil ? missing_name : name
   end

   def missing_name
     raise RuntimeError, 'A name is required'
   end

   def missing_account
     raise RuntimeError, 'No account present'
   end

   def insufficient_cash
     raise RuntimeError, 'Insufficient cash'
   end

   def missing_atm
     raise RuntimeError, 'An ATM is required'
   end

end
