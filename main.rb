# frozen_string_literal: true

require_relative 'lib/dictionary'

dict = Dictionary.new
my_word = dict.random_word
puts my_word
puts dict.mask_word(my_word)

# puts dict_arr.count

# dict.lineno = rand(1..dict_arr.count)
# puts dict.pos
# word = dict.gets
# puts word
