require 'date'
require 'optparse'

date = DateTime.now
selected_month = Date.today.month

opt = OptionParser.new
opt.on('-m MONTH') do |v|
  month_number = v.to_i
  if month_number > 0 && month_number < 13
    selected_month = month_number
  else
    puts "#{v} is neither a month number (1..12) nor a name"
    exit(1)
  end
end

opt.parse(ARGV)

calender_year_date = date.strftime("#{selected_month}月 %Y年")
puts "     #{calender_year_date}"

a = Date.new(2023, selected_month, 1)
b = Date.new(2023, selected_month, -1)

numbers = []
(a..b).each do |date|
  numbers << date.mday
end

first_day = (a.wday + 6) % 7
week = %w[月 火 水 木 金 土 日]
puts week.join(' ')
print '   ' * first_day

numbers.each do |day|
  space = day.to_s.rjust(2)
  print "#{space} "
  puts if ((day + first_day) % 7).zero?
end