class User < ApplicationRecord

  def password
    alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
    special_chars = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+', '[', '{', ']', '}', '\\', '|', ';', ':', "'", '"', ',', '<', '.', '>', '/', '?']
    digits = (0..9).to_a

    password = []
    password << alphabet.sample
    password << special_chars.sample
    password << digits.sample

    (1..5).each do |i|
      char_category = [alphabet, special_chars, digits].sample
      password << char_category.sample
    end

    password.shuffle.join[0..7]
  end

end
