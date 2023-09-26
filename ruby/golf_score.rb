input = gets.chomp.split(",").map(&:to_i)
input2 = gets.chomp.split(",").map(&:to_i)

result = input.zip(input2).map { |x, y| y - x }
output = []
result.each do |score|
  x, y = input.zip(input2).find { |a, b| b - a == score }

  if x == 3 && y == 1
    output << "ホールインワン"
  elsif x == 4 && y == 1
    output << "ホールインワン"
  elsif x == 5 && y == 2
    output << "アルバトロス"
  elsif x == 5 && y == 1
    output << "コンドル"
  elsif x == 4 && y == 2
    output << "イーグル"
  elsif  x == 5 && y == 3
    output << "イーグル"
  elsif score == 0
    output << "パー"
  elsif score == -1
    output << "バーディ"
  elsif score == 1
    output << "ボギー"
  else
    output << "#{score}ボギー"
  end
end

puts output.join(",")