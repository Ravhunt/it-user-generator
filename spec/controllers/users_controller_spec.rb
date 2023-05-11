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

      expect(response).to redirect_to(User.last)
    end

    it "generates a random password for new user" do
      user = User.new
      password = user.password
      expect(password.length).to eq(8)
      expect(password).to match(/[a-zA-Z]/)
      expect(password).to match(/\d/)
      expect(password).to match(/[^a-zA-Z\d]/)
    end
  end
end
