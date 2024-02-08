# frozen_string_literal: true

require_relative 'juice'
require_relative 'suica'

# 自動販売機
class VendingMachine
  attr_reader :stock, :total_sales

  def initialize
    @stock = {}
    @total_sales = 0
  end

  def add_juice(juice, count)
    if @stock.key?(juice)
      @stock[juice] += count
    else
      @stock[juice] = count
    end
  end

  # 購入可能なドリンクの名前を配列で返す
  def stock_array
    @stock.select { |_, count| count.positive? }.keys.map(&:name)
  end

  def buy_juice(suica, juice)
    raise '残高が足りません' if suica.balance < juice.price
    raise '在庫がありません' if (@stock[juice]).zero?

    @stock[juice] -= 1
    @total_sales += juice.price
    suica.pay(juice.price)
  end
end

# Suicaインスタンスの生成
suica = Suica.new

# ジュースインスタンスの生成
pepsi = Juice.new('ペプシ', 150)
monster = Juice.new('モンスター', 230)
irohasu = Juice.new('いろはす', 120)

# 自動販売機インスタンスの生成
vending_machine = VendingMachine.new

# ジュースを追加
vending_machine.add_juice(pepsi, 5)
vending_machine.add_juice(monster, 5)
vending_machine.add_juice(irohasu, 5)

# 在庫の補充
vending_machine.add_juice(pepsi, 5)

# 購入可能なドリンクのリストを取得
vending_machine.stock_array

# 飲み物を購入
vending_machine.buy_juice(suica, irohasu)

# 売り上げ残高の取得
vending_machine.total_sales
