require 'rails_helper'

RSpec.describe "admins/new", type: :view do
  before(:each) do
    assign(:admin, Admin.new(
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :home_phone => "MyString",
      :mobile_phone => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new admin form" do
    render

    assert_select "form[action=?][method=?]", admins_path, "post" do

      assert_select "input#admin_first_name[name=?]", "admin[first_name]"

      assert_select "input#admin_middle_name[name=?]", "admin[middle_name]"

      assert_select "input#admin_last_name[name=?]", "admin[last_name]"

      assert_select "input#admin_home_phone[name=?]", "admin[home_phone]"

      assert_select "input#admin_mobile_phone[name=?]", "admin[mobile_phone]"

      assert_select "input#admin_email[name=?]", "admin[email]"
    end
  end
end
