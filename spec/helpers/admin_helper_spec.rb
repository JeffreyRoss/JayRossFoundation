require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AdminHelper. For example:
#
# describe AdminHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AdminHelper, type: :helper do
	include AdminHelper
	
	describe "activeSubMenu?" do


  	context 'with parameter' do
  		before(:each) do
  			activeSubMenu?("aboutus")
  		end
	    it "should set the params action" do
	     	expect(params[:action]).to eql('aboutus')
	    end
	end

	context 'with no parameter' do
		before(:each) do
  			activeSubMenu?()
  		end
	    it "should fail" 
	end
  end
end
