# frozen_string_literal: true

# Class for instances of a Hangman game
class Game
  attr_reader :solution

  def initialize
    @dict = Dictionary.new
    @solution = @dict.random_word
    @solution_arr = @solution.split('')
    @solution_masked = Output.mask_word(@solution)
  end

  def prompt_guess
    puts 'Guess a letter: '
    gets.chomp.to_s[0]
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

  def guess_letter
    guess = prompt_guess

    if @solution_arr.include? guess
      puts 'Nice guess!'
      unmask_letter(guess)
    else
      puts "No #{guess}..."
    end
    puts @solution_masked
  end
end
