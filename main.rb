# frozen_string_literal: true

require_relative 'lib/dictionary'
require_relative 'lib/output'

# Class for instances of a Hangman game
class Game
  attr_reader :solution

  def initialize
    @dict = Dictionary.new
    @solution = @dict.random_word
    @solution_arr = @solution.split('')
    @solution_masked = Output.mask_word(@solution)
  end

  def check_letter(guess)
    @solution_arr.include? guess
  end

  def unmask_letter(guess)
    letter_indices = []
    @solution_arr.each_with_index do |letter, index|
      letter_indices << (index * 2) + 1 if letter == guess
    end
    letter_indices.each do |index|
      @solution_masked[index] = guess.upcase
    end
  end

  def guess_letter(guess)
    if check_letter(guess)
      puts 'Nice guess!'
      unmask_letter(guess)
    else
      puts "No #{guess}! Guess again."
    end
    puts @solution_masked
  end
end

hangman = Game.new
puts hangman.solution
puts hangman.guess_letter('e')

# puts dict_arr.count

# dict.lineno = rand(1..dict_arr.count)
# puts dict.pos
# word = dict.gets
# puts word
