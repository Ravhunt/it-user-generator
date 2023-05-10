class User < ApplicationRecord

  def password(length = 8)
    chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    password = ''
    length.times { password << chars.sample }
    password
  end

end