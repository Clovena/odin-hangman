# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/dictionary'
require_relative 'lib/output'

hangman = Game.new
puts hangman.solution
puts hangman.guess_letter until hangman.turns_rem <= 0

# puts dict_arr.count

# dict.lineno = rand(1..dict_arr.count)
# puts dict.pos
# word = dict.gets
# puts word
