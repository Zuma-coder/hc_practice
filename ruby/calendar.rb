# frozen_string_literal: true

require 'optparse'
require 'date'

# オプション格納用の変数
options = {}

opt = OptionParser.new
opt.on('-m month') do |month|
  # 不正な数字を受け取ったらエラーを返す
  if !month.to_i.between?(1, 12)
    puts "#{month} is neither a month number (1..12) nor a name"
    return
  end

  options[:month] = month.to_i
end

opt.parse!(ARGV)

today = Date.today
year = today.year
month = options[:month].nil? ? today.month : options[:month]
first_day =Date.new(year, month)
last_day =Date.new(year, month, -1)

# カレンダーの初日の位置調整のための空白を取得するメソッド
# 要件が月曜始まりのためこのような書き方になる（日曜始まりならこの部分は不要...）
def get_blank(first_day)
  if first_day.wday == 0
    "   " * (first_day.wday + 6)
  else
    "   " * (first_day.wday - 1)
  end
end

puts "     #{month}月 #{year}"
puts "月 火 水 木 金 土 日"
(1..last_day.day).each do |i|
  if i == 1
    # 初日のみ空白で位置調整
    printf("%s", get_blank(first_day))
    printf("%2d ", i)
  else
    printf("%2d ", i)
  end

  # 日曜日で改行
  puts if Date.new(year, month, i).sunday?
end

# 最終日出力後改行
puts
