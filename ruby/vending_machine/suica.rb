# frozen_string_literal: true

# Suica
class Suica
  attr_reader :balance

  def initialize
    @balance = 500
  end

  def charge(amount)
    raise '100円未満の金額はチャージできません' if amount < 100

    @balance += amount
  end

  def pay(price)
    @balance -= price
  end
end
