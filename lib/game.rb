# frozen_string_literal: true

# Class for instances of a Hangman game
class Game
  attr_reader :solution

  def initialize
    @dict = Dictionary.new
    @solution = @dict.random_word
    @solution_masked = Output.mask_word(@solution)
    @turns_rem = 8
    @guesses = []
  end

  def play
    puts 'Welcome to Hangman!'
    puts @solution_masked
    puts guess_letter until @turns_rem <= 0
  end

  def guess_letter
    guess = prompt_guess
    handle_guess(guess)
    @guesses << guess
    puts "Letters guessed: #{Output.format_guesses(@guesses)}"
    puts @solution_masked
  end

  def prompt_guess
    puts "#{@turns_rem} incorrect guesses left."
    puts 'Guess a letter: '
    guess = gets.chomp.to_s.upcase[0]
    while @guesses.include?(guess)
      puts "#{guess} already guessed. Guess a letter: "
      guess = gets.chomp.to_s.upcase[0]
    end
    guess
  end

  def handle_guess(guess)
    if @solution.include?(guess)
      puts "\nGood guess!"
      @solution_masked = Output.unmask_letter(guess, @solution, @solution_masked)
    else
      puts "\nNo #{guess} ..."
      @turns_rem -= 1
    end
  end
end
