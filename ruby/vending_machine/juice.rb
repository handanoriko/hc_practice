class Juice
  JUICES = [:pepsi, :monster, :irohasu]

  def initialize
      @kinds = kinds
      @num = 5
      @price = price
      calculate_price
  end

  def kinds
    @kinds
  end

  def kinds=(kinds)
    @kinds = kinds
  end

  def num
    @num
  end

  def num=(num)
    @num = num
  end

  def price
    calculate_price
    @price
  end

  # def price=(price)
  #   @price = price
  # end


  def calculate_price
    if @kinds == :monster
      @price = 230
    elsif @kinds == :irohasu
      @price = 120
    else
      @price = 150
    end
  end

#  def juice_info
#   puts "#{kinds}, #{calculate_price}円, #{num}本"
#  end

end