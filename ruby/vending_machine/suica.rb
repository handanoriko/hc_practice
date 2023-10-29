# Suicaクラスはスイカのチャージと残高を表現します。
class Suica
    def initialize
      @price = 500
    end
  
    attr_writer :price
    attr_reader :price
  
    def charge(amount)
      raise 'チャージは100円以上からです' if amount < 100 && amount > 1
  
      @price += amount
    end
  end