# frozen_string_literal: false

# Module to hold methods for formatting outputs
module Output
  def self.mask_word(word)
    masked = ''
    word.length.times { masked << ' -' }
    masked
  end
end
