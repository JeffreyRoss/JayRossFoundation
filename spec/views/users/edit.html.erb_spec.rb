require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, create(:user))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_middle_name[name=?]", "user[middle_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_home_phone[name=?]", "user[home_phone]"

      assert_select "input#user_mobile_phone[name=?]", "user[mobile_phone]"

      assert_select "input#user_email[name=?]", "user[email]"
    end
  end
end
