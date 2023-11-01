# Suicaクラスはスイカのチャージと残高を表現します。
class Suica
  def initialize
    @balance = 500
  end

  attr_reader :balance

  def charge(amount)
    raise 'チャージは100円以上からです' if amount < 100 && amount > 1

    @balance += amount
  end
end
