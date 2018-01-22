

class ATM
  attr_accessor :funds

  def initialize()
    @funds = 1000
  end

  def withdraw(number)
    @funds -= number
  end

end
