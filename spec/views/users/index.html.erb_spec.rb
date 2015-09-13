require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      create(:user),
      create(:user)
    ])
  end

  it "renders a list of users" do
    render

    assert_select "div.manageUsersHeaders" do
      assert_select "div.h4", :text => "First Name".to_s, :count => 1
      assert_select "div.h4", :text => "Middle Name".to_s, :count => 1
      assert_select "div.h4", :text => "Last Name".to_s, :count => 1
      assert_select "div.h4", :text => "Home Phone".to_s, :count => 1
      assert_select "div.h4", :text => "Mobile Phone".to_s, :count => 1
      assert_select "div.h4", :text => "Email".to_s, :count => 1
      assert_select "div.h4", :text => "Role".to_s, :count => 1
    end 
  end
end
