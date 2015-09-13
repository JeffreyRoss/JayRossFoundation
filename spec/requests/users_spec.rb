require 'rails_helper'

RSpec.describe "User", type: :request do
  describe "GET /users" do

  	context 'when logged in' do

	    it "return found http request status if user not logged in" do
	      get users_path
	      expect(response).to have_http_status(302)
	    end

	end

  end
end
