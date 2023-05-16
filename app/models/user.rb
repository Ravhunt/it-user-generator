class User < ApplicationRecord
  before_validation :capitalize_names

  def password
    lowercase_letters = ('a'..'z').to_a
    uppercase_letters = ('A'..'Z').to_a
    digits = (0..9).to_a

    password = ''
    
    password += lowercase_letters.sample(3).join

    password += digits.sample(3).join

    password += uppercase_letters.sample(3).join

    password
  end

  def username
    first_initial = first_name[0].downcase
    last_name_normalized = last_name.downcase.gsub(/\s+/, '') # Remove any whitespace from last_name

    "#{first_initial}#{last_name_normalized}"
  end

  def email
    first_initial = first_name[0].capitalize
    last_name_normalized = last_name.downcase.gsub(/\s+/, '') # Remove any whitespace from last_name
    domain = "@tbrown.com"

    "#{first_name.capitalize}.#{last_name.capitalize}#{domain}"
  end


private

  def capitalize_names
    self.first_name = first_name.capitalize if first_name.present?
    self.last_name = last_name.capitalize if last_name.present?
  end

end
