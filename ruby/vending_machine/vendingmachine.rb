require_relative './suica'
require_relative './juice'

class Vendingmachine
  def initialize
    @sales = 0
    @juice = Juice.new
    @salesNum = @juice.num
    @suica = Suica.new
  end

  def purchase(juice_kinds, amount)
    juice_num = @juice.num
    @juice.kinds = juice_kinds
    # @juice.calculate_price
    amount = @suica.charge(amount)
    p "◆◆◆◆◆◆◆◆◆◆◆◆amount#{amount}"
    
    # total_price = @juice.price * salesNum
    price = @juice.price
    # p @juice.price
    juice_num = @juice.num
    
    
    # juice_num = @salesNum - 1

    # p "salesNum #{salesNum}"
   
    # p "juice_num #{juice_num}"

    # juice_num -= salesNum
    @sales +=  price
    salesPrice = amount - @sales

    if salesPrice >=  price
      @salesNum -= 1
      # p "#{salesPrice}salesPrice"
      # p "#{price}price"
      # p @juice.calculate_price
      # p "salesNum #{@salesNum}"
    # @sales += total_price
    # 

    # suica.deduct(total_price)

    # p amount
    # p salesPrice
    # p juice_num
    puts "1本の#{@juice.kinds}を#{price}円で購入しました。price"
    puts "Suicaのチャージ残高は#{salesPrice}円salesPrice"
    puts "juiceの残数は#{@salesNum}本"
    puts "売上高: #{@sales}円"
    # puts @juice.juice_info
    end

    
      raise "残高が足りません" if salesPrice < price
      raise "在庫がありません" if @salesNum < 0

  end

end


