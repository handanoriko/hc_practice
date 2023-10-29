# Juiceクラスはジュースの名前、本数、金額を表現します。
class Juice
  def initialize(name, num, price)
    @name = name
    @num = num
    @price = price
  end

  attr_writer :name, :num
  attr_reader :price, :name, :num
end