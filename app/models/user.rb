class User < ApplicationRecord
  # ...

  def password
    alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
    special_chars = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+', '[', '{', ']', '}', '\\', '|', ';', ':', "'", '"', ',', '<', '.', '>', '/', '?']
    digits = (0..9).to_a

    # Generate a password with one random character from each of the three categories
    password = []
    password << alphabet.sample
    password << special_chars.sample
    password << digits.sample

    # Generate the remaining characters randomly from all three categories
    (1..5).each do |i|
      char_category = [alphabet, special_chars, digits].sample
      password << char_category.sample
    end

    password.shuffle.join[0..7] # Take the first 8 characters of the shuffled password
  end

  # ...
end
