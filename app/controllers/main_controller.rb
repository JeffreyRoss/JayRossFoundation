class MainController < ApplicationController
  def home
    @activePaths = Array['']    
  end

  def aboutus
    @activePaths = Array['aboutus','team','aboutjay']
  end 

  def team
    @activePaths = Array['aboutus','team','aboutjay']
  end

  def aboutjay
    @activePaths = Array['aboutus','team','aboutjay']
  end

  def initiatives
    @activePaths = Array['initiatives']    
  end

  def takeaction
    @activePaths = Array['takeaction']    
  end

  def ourimpact
    @activePaths = Array['ourimpact']    
  end

  def contact
    @activePaths = Array['contact']    
  end
end
