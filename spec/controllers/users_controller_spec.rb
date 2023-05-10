require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    it "creates new user" do 
      user_params = {
        first_name: "John",
        last_name: "Smith"
      }

      expect do
        post :create, params: { user: user_params }
      end.to change(User, :count).by(1)

      expect(response).to redirect_to(User.last)
    end
  end
end
