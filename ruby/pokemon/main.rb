require_relative './pokemon'
require_relative './pikachu'
require_relative './player'

name = 'リザードン'
type1 = 'ほのお'
type2 = 'ひこう'
hp = 100
mp = 50

pokemon = Pokemon.new(name, type1, type2, hp, mp)
puts pokemon.name
puts pokemon.type1
puts pokemon.mp

pokemon.change_name('テキセツ')
pokemon.get_name

pika = Pikachu.new('ピカチュウ', 'でんき', '', 100, '')
pika.attack
puts pika.name

player = Player.new('プレイヤー1', 'でんき', '', 100, 50)
player.attack
