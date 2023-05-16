require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    it "creates new user" do 
      user_params = {
        first_name: "John",
        last_name: "Smith",
        password: "some_password123"
      }

      expect do
        post :create, params: { user: user_params }
      end.to change(User, :count).by(1)

      user = User.last
      expect(user.email).to eq("John.Smith@tbrown.com")
      expect(user.first_name).to eq("John")
      expect(user.last_name).to eq("Smith")

      expect(response).to redirect_to(User.last)
    end

    it "generates a random password with 3 lowercase letters, 3 random numbers, and 3 uppercase letters" do
      post :create, params: { user: { first_name: "John", last_name: "Smith" } }
      user = User.last
      password = user.password

      expect(password.length).to eq(9) # 3 lowercase letters + 3 digits + 3 uppercase letters
      expect(password).to match(/^[a-z]{3}[0-9]{3}[A-Z]{3}$/)
    end

    it "generates a username from the first letter of first_name and the full last_name" do
      post :create, params: { user: { first_name: "John", last_name: "Smith" } }
      user = User.last
      expected_username = "jsmith"

      expect(user.username).to eq(expected_username)
    end


    
  end
end
