

class ATM
  attr_accessor :funds
  require 'date'

  def initialize()
    @funds = 1000
  end

  def withdraw(amount, pin_code, account)
    case
    when insufficient_funds_in_account?(amount, account)
      { status: false, message: 'insufficient funds', date: Date.today }
    when insufficient_funds_in_ATM?(amount)
      { status: false, message: 'insufficient funds in ATM', date: Date.today }
    when incorrect_pin?(pin_code, account.pin_code)
      { status: false, message: 'Wrong pin', date: Date.today}
    when expired_card?(account.exp_date)
      { status: false, message: "expired card", date: Date.today }
    else
      perform_transaction(amount,account)
    end
  end

  private

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  private

  def insufficient_funds_in_ATM?(amount)
    @funds < amount
  end

  private

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  private

  def expired_card?(exp_date)
    Date.strptime(exp_date, '%m/%y') < Date.today
  end

  def perform_transaction(amount, account)
    @funds -= amount
    account.balance = account.balance - amount
    {status: true, message: 'success', date: Date.today, amount: amount}
  end

end
