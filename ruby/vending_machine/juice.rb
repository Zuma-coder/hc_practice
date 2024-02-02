# frozen_string_literal: true

# ジュース
class Juice
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
