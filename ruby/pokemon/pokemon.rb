require_relative './interface'

# ポケモン
class Pokemon
  include NameService

  def initialize(name, type1, type2, hp, mp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
    @mp = mp
  end

  attr_reader :name, :type1, :type2, :hp, :mp

  def attack
    raise NotImplementedError, 'attackメソッドを実装してください'
  end
end
