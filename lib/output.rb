# frozen_string_literal: false

# Module to hold methods for formatting outputs
module Output
  def self.mask_word(word)
    masked = ''
    word.length.times { masked << ' -' }
    masked
  end

  def self.unmask_letter(guess, solution, solution_masked)
    letter_indices = []
    solution.split('').each_with_index do |letter, index|
      letter_indices << (index * 2) + 1 if letter == guess
    end
    letter_indices.each do |index|
      solution_masked[index] = guess
    end
    solution_masked
  end

  def self.format_guesses(guesses)
    guesses.uniq.join(' ')
  end

  def self.random_filename
    color = %w[red orange yellow green blue indigo violet
               pink peach buttercup lime periwinkle lilac lavender]
    noun  = %w[chair dog kitten pancake bread ring pillow
               purse crystal tube sandwich radio puddle notebook]
    "#{color[rand(0..color.length)]}_#{noun[rand(0..noun.length)]}_#{rand(0..9)}#{rand(0..9)}"
  end
end
