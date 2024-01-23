# frozen_string_literal: true

par_array = gets.chomp.split(',')
strokes_array = gets.chomp.split(',')
results_array = []

score_names = {
  4 => '4ボギー',
  3 => '3ボギー',
  2 => '2ボギー',
  1 => 'ボギー',
  0 => 'パー',
  -1 => 'バーディ',
  -2 => 'イーグル',
  -3 => 'アルバトロス',
  -4 => 'コンドル'
}

hole_count = 18
# ホールの回数繰り返す
hole_count.times do |i|
  # 打数が1のときホールインワン
  # ただしパー5のホールのみホールインワンとならない
  if par_array[i].to_i != 5 && strokes_array[i].to_i == 1
    results_array << 'ホールインワン'
    next
  end

  # スコア計算
  penalties = strokes_array[i].to_i - par_array[i].to_i

  results_array << score_names[penalties]
end

puts results_array.join(',')
