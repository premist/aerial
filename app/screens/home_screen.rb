class HomeScreen < PM::Screen
  attr_accessor :pm10value
  
  def on_load
    view.styleId = "home"
    
    value = pm10value.to_s.to_i
    
    if value < 30
      view.styleClass = "aq-good"
    elsif value < 80
      view.styleClass = "aq-moderate"
    elsif value < 120
      view.styleClass = "aq-bad"
    else
      view.styleClass = "aq-verybad"
    end
    
    @title =  value.to_s.uilabel
    @title.frame = [[0,0], [320,120]]
    @title.styleId = "aq-value"
    
    view << @title
    
  end
  
  def will_appear
  end
  
  def preferredStatusBarStyle
    UIStatusBarStyleLightContent
  end
  
end