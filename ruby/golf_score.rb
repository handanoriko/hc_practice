input = gets.chomp.split(',').map(&:to_i)
input2 = gets.chomp.split(',').map(&:to_i)
output = []
input.zip(input2).map do |x, y|
  score = y - x

  output << if x == 3 && y == 1
              'ホールインワン'
            elsif x == 4 && y == 1
              'ホールインワン'
            elsif x == 5 && y == 2
              'アルバトロス'
            elsif x == 5 && y == 1
              'コンドル'
            elsif x == 4 && y == 2
              'イーグル'
            elsif x == 5 && y == 3
              'イーグル'
            elsif score.zero?
              'パー'
            elsif score == -1
              'バーディ'
            elsif score == 1
              'ボギー'
            else
              "#{score}ボギー"
            end
end

puts output.join(',')
