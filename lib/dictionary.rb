# frozen_string_literal: false

# Hangman Dictionary, for storing and generating words
class Dictionary
  def initialize
    @dict = IO.readlines("#{__dir__}/dictionary.txt")
              .select { |word| word.strip.length.between?(5, 12) }
  end

  def random_word
    @dict[rand(0..@dict.length)].chomp
  end

  def mask_word(word)
    masked = ''
    word.length.times { masked << ' -' }
    masked
  end
end
