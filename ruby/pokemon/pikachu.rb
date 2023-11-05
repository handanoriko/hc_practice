# ピカチュウ
class Pikachu < Pokemon
  def initialize(name, type1, type2, hp, mp)
    super(name, type1, type2, hp, mp)
  end

  def attack
    puts "#{name} の10万ボルト!"
  end
end
