require 'rails_helper'

RSpec.describe MainController, type: :controller do
  describe "GET #home" do
  	before(:each) do  	
  		get :home
  	end

  	it 'should set the default page title' do
  		pageTitle = "JRFoundation"
  		expect(assigns(:pageTitle)).to eq(pageTitle)
  	end  	

  	it 'should set the active menu paths to empty' do
  		activeMenuPaths = Array[''] 
  		expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
  	end    	
  end

  describe "GET #aboutus" do
  	before do
  		get :aboutus
  	end
  	it 'should change page title to About Us' do
  		pageTitle = "JRFoundation - About Us"
  		expect(assigns(:pageTitle)).to eq(pageTitle)
  	end  	

  	it 'should set the active menu button' do
  		activeMenuPaths = Array['aboutus','team','aboutjay']
  		expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
  	end     	
  end
  
  describe "GET #team" do
  	before do
  		get :team
  	end
  	it 'should change page title to Team' do
  		pageTitle = "JRFoundation - Team"
  		expect(assigns(:pageTitle)).to eq(pageTitle)
  	end  	

  	it 'should set the active menu button' do
  		activeMenuPaths = Array['aboutus','team','aboutjay'] 
  		expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
  	end     	 	
  end
  
  describe "GET #aboutjay" do
  	before do
  		get :aboutjay
  	end
  	it 'should change page title to About Jay' do
  		pageTitle = "JRFoundation - About Jay"
  		expect(assigns(:pageTitle)).to eq(pageTitle)
  	end  	

  	it 'should set the active menu button' do
  		activeMenuPaths = Array['aboutus','team','aboutjay'] 
  		expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
  	end      	
  end 

  describe "GET #initiatives" do
  	before do
  		get :initiatives
  	end
  	it 'should change page title to Initiatives' do
  		pageTitle = "JRFoundation - Initiatives"
  		expect(assigns(:pageTitle)).to eq(pageTitle)
  	end  	

  	it 'should set the active menu button' do
  		activeMenuPaths = Array['initiatives'] 
  		expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
  	end 
  end

  describe "GET #takeaction" do
  	before do
  		get :takeaction
  	end
   	it 'should change page title to Take Action' do
  		pageTitle = "JRFoundation - Take Action"
  		expect(assigns(:pageTitle)).to eq(pageTitle)
  	end 	

  	it 'should set the active menu button' do
   		activeMenuPaths = Array['takeaction'] 
  		expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
  	end     	
  end
  
  describe "GET #ourimpact" do
  	before do
  		get :ourimpact
  	end
  	it 'should change page title to Our Impact' do
  		pageTitle = "JRFoundation - Our Impact"
  		expect(assigns(:pageTitle)).to eq(pageTitle)
  	end  	

  	it 'should set the active menu button' do
  		activeMenuPaths = Array['ourimpact'] 
  		expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
  	end       	
  end
  
  describe "GET #contact" do
  	before do
  		get :contact
  	end
  	it 'should change page title to Contact' do
  		pageTitle = "JRFoundation - Contact Us"
  		expect(assigns(:pageTitle)).to eq(pageTitle)
  	end  	

  	it 'should set the active menu button' do
  		activeMenuPaths = Array['contact'] 
  		expect(assigns(:activeMenuPaths)).to eq(activeMenuPaths)
  	end    	   	
  end 
end
