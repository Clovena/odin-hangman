# frozen_string_literal: true

# Hangman Dictionary, for storing and generating words
class Dictionary
  def initialize
    @dict = IO.readlines('lib/dictionary.txt')
              .select { |word| word.strip.length.between?(5, 12) }
  end

  def random_word
    @dict[rand(0..@dict.length)].chomp.upcase
  end
end
