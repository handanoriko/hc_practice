# Juiceクラスはジュースの名前、本数、金額を表現します。
class Juice
  def initialize(name, num, price)
    @name = name
    @num = num
    @price = price
  end

  attr_reader :price, :name, :num

  def lot(stock)
    @num += stock
  end

  def reduce_stock
    @num -= 1 if @num.positive?
  end
end
