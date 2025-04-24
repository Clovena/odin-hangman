# frozen_string_literal: true

require 'json'
require_relative 'lib/game'
require_relative 'lib/dictionary'
require_relative 'lib/output'

hangman = Game.new
hangman.play
# puts hangman.save_game
