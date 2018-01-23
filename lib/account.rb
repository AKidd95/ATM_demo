class Account
  require 'date'
  attr_accessor :pin_code, :balance, :account_status

  STANDARD_VALIDITY_YRS = 5

  def initialize()
    @pin_code = generate_pin
    @balance = 0
    @account_status = :active
  end

  def exp_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end

  def deactivate
    @account_status = :deactivated
  end
  
  private
  def generate_pin
    rand(1000..9999)
  end

end
