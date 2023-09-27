input = gets.chomp.split(',').map(&:to_i)
input2 = gets.chomp.split(',').map(&:to_i)
output = []

SCORE_LIST = {
  1 => "ボギー",
  0 => "パー",
  -1 => "バーディー",
  -2 => "イーグル",
  -3 => "アルバトロス",
  -4 => "コンドル",
}

input.zip(input2).map do |x, y|
  score = y - x

  output << if (3..4).cover?(x) && y == 1
    'ホールインワン'
  elsif score >= 2
    "#{score}ボギー"
  else
    SCORE_LIST[score]
  end
end

puts output.join(',')
