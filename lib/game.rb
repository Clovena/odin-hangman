# frozen_string_literal: true

# Class for instances of a Hangman game
class Game
  attr_reader :solution, :turns_rem

  def initialize
    @dict = Dictionary.new
    @solution = @dict.random_word
    @solution_arr = @solution.split('')
    @solution_masked = Output.mask_word(@solution)
    @turns_rem = 8
  end

  def prompt_guess
    @turns_rem -= 1
    puts @turns_rem
    puts 'Guess a letter: '
    gets.chomp.to_s[0]
  end

  def guess_letter
    guess = prompt_guess
    if @solution_arr.include? guess
      puts 'Good guess!'
      @solution_masked = Output.unmask_letter(
        guess, @solution_masked, @solution_arr
      )
    else
      puts "No #{guess}..."
    end
    puts @solution_masked
  end
end
