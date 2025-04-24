# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/dictionary'
require_relative 'lib/output'

hangman = Game.new
hangman.play
# puts hangman.solution

# Next steps:
# Track guesses made
# Block a guess if it's already been made
# Escape game if word is solved
# Serialize
