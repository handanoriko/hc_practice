require_relative './suica'
require_relative './juice'

# Vendingmachineクラスは自動販売機の機能を表現します。
class Vendingmachine
  def initialize
    @juices = [
      Juice.new('pepsi', 5, 150),
      Juice.new('monster', 5, 230),
      Juice.new('irohasu', 5, 120)
    ]
    @sales = 0
  end

  def purchase(juice_name, suica)
    juice = @juices.find { |j| j.name == juice_name.to_s }

    raise '残高が足りません' if suica.balance < juice.price

    raise '在庫がありません' if juice.num <= 0

    @sales += juice.price

    suica.reduce_fee(juice.price)

    juice.reduce_stock

    puts "■1本の#{juice.name}を#{juice.price}円で購入しました。"
    puts "#{juice.name}の残数は#{juice.num}本"
    puts "売上金額: #{@sales}円"
  end

  def charge(amount, suica)
    suica.charge(amount)

    puts "#{amount}円をチャージしてSuicaのチャージ残高は#{suica.balance}円"
  end

  def list
    puts '購入可能なドリンクのリストは'

    @juices.each do |juice|
      puts "#{juice.name} #{juice.num}本"
    end
  end

  def assort(juice_name, stock)
    juice = @juices.find { |j| j.name == juice_name.to_s }

    juice.lot(stock)

    puts "#{juice_name}の残数を#{stock}本追加"
  end
end
