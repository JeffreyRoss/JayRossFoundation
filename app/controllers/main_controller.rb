class MainController < ApplicationController
  def home
    @pageTitle = "JRFoundation"
    @activeMenuPaths = Array['']    
  end

  def aboutus
    @pageTitle = "JRFoundation - About Us"
    @activeMenuPaths = Array['aboutus','team','aboutjay']
  end 

  def team
    @pageTitle = "JRFoundation - Team"
    @activeMenuPaths = Array['aboutus','team','aboutjay']
  end

  def aboutjay
    @pageTitle = "JRFoundation - About Jay"
    @activeMenuPaths = Array['aboutus','team','aboutjay']
  end

  def initiatives
    @pageTitle = "JRFoundation - Initiatives"
    @activeMenuPaths = Array['initiatives']    
  end

  def takeaction
    @pageTitle = "JRFoundation - Take Action"
    @activeMenuPaths = Array['takeaction']    
  end

  def ourimpact
    @pageTitle = "JRFoundation - Our Impact"
    @activeMenuPaths = Array['ourimpact']    
  end

  def contact
    @pageTitle = "JRFoundation - Contact Us"
    @activeMenuPaths = Array['contact']    
  end
end
