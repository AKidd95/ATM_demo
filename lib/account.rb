class Account
  require 'date'
  attr_accessor :pin_code, :balance

  STANDARD_VALIDITY_YRS = 5

  def initialize()
    @pin_code = generate_pin
    @balance = 0
  end

  def exp_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end

  private
  def generate_pin
    rand(1000..9999)
  end

end
