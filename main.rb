# frozen_string_literal: true

require_relative 'lib/dictionary'

def guess_letter(guess, solution)
  word_arr = solution.split('')
  word_masked = Dictionary.new.mask_word(solution)
  letter_indices = []

  word_arr.each_with_index do |letter, index|
    letter_indices << (index * 2) + 1 if letter == guess
  end

  letter_indices.each do |index|
    word_masked[index] = guess.upcase
  end
  word_masked
end

puts guess_letter('e', 'healthier')

# puts dict_arr.count

# dict.lineno = rand(1..dict_arr.count)
# puts dict.pos
# word = dict.gets
# puts word
