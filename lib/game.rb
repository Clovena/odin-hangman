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
    @saved = false
  end

  def play
    puts 'Welcome to Hangman!'
    puts @solution_masked
    puts guess_letter until game_over? || @saved
  end

  def guess_letter
    puts "#{@turns_rem} incorrect guesses left."
    guess = prompt_guess
    return if @saved

    handle_guess(guess)
    @guesses << guess
    puts "Letters guessed: #{Output.format_guesses(@guesses)}"
    puts @solution_masked
  end

  def prompt_guess
    puts 'Guess a letter: '
    guess_raw = gets.chomp.upcase
    if guess_raw == 'SAVE'
      save_game
      ''
    elsif guess_raw == 'LOAD'
      load_game
      ''
    else
      guess = guess_raw[0]
      while @guesses.include?(guess)
        puts "#{guess} already guessed."
        prompt_guess
      end
      guess
    end
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

  def game_over?
    if @turns_rem <= 0
      puts 'No more guesses ... game over.'
      return true
    elsif !(@solution_masked.include? '-')
      puts 'Congratulations! You win!'
      return true
    end
    false
  end

  def save_game
    filename = "save/#{Output.random_filename}.json"
    game_data = JSON.dump({
                            solution: @solution,
                            solution_masked: @solution_masked,
                            turns_rem: @turns_rem,
                            guesses: @guesses
                          })
    File.open(filename, 'w') { |f| f.write(game_data) }
    puts "Game saved to #{filename}."
    @saved = true
  end

  def list_saves
    saved_games = Dir.entries('save')
    saved_games.shift(2)
    saved_games
  end

  def load_game
    puts 'Select a saved game:'
    puts list_saves
    select = gets.chomp
    until File.file?("save/#{select}")
      puts 'No saved game found. Select a saved game:'
      select = gets.chomp
    end
    load_instance(JSON.parse(File.read("save/#{select}")))
  end

  def load_instance(load)
    @solution = load['solution']
    @solution_masked = load['solution_masked']
    @turns_rem = load['turns_rem']
    @guesses = load['guesses']
  end
end
