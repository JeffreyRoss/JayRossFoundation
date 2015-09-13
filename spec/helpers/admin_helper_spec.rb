require 'rails_helper'

RSpec.describe AdminHelper, type: :helper do
	include AdminHelper
	
	describe "activeSubMenu?" do

	  	context 'with parameter' do
	  		before(:each) do
	  			helper.params[:action] = "aboutus"
	  		end

		    it "should return true" do
		     	activeSubMenu?("aboutus").should eql true
		    end
		end

		context 'with no parameter' do

		    it "should return false" do
		    	activeSubMenu?('').should eql false
		    end

		end
  end
end
