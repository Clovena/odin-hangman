# frozen_string_literal: true

dict_arr = IO.readlines("#{__dir__}/dictionary.txt")
dict_valid = dict_arr.select do |word|
  word.strip.length.between?(5, 12)
end
random_word = dict_valid[rand(0..dict_valid.length)]

puts random_word

# puts dict_arr.count

# dict.lineno = rand(1..dict_arr.count)
# puts dict.pos
# word = dict.gets
# puts word
