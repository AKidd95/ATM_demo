class Account
  require 'date'

  STANDARD_VALIDITY_YRS = 5

  def exp_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
  end


end
