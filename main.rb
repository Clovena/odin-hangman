# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/dictionary'
require_relative 'lib/output'

hangman = Game.new
puts hangman.solution
puts hangman.guess_letter until hangman.turns_rem <= 0

# Next steps:
# Track guesses made
# Block a guess if it's already been made
# Escape game if word is solved
# Serialize
