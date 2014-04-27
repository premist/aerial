class HomeScreen < PM::Screen
  
  def on_load
    self.stylesheet = :home
    self.view.stylename = :view
    
    # view.styleId = "home"
    
    
    @root = UIScrollView.alloc.initWithFrame([[0,20],[320,548]])
    @root.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    @root.contentSize = CGSizeMake(320,550)
    view << @root
    
    if Device.screen.height == 480
      # @root.styleClass = "ip4s"
    end
    
    @block = UIView.alloc.initWithFrame([[0,0], [320,20]])
    # @block.styleId = "status-block"
    view << @block
    
    @root << @indicator
    
    @root.addPullToRefreshWithActionHandler(lambda do
      
      EM.add_timer 0.5 { fetch_airquality }
      
    end)
    
   #  @root.pullToRefreshView.styleId = "pull-to-refresh"
    @root.pullToRefreshView.stylename = :pull_to_refresh
    @root.pullToRefreshView.textColor = "#FFF".uicolor
    @root.pullToRefreshView.arrowColor = "#FFF".uicolor
    @root.pullToRefreshView.activityIndicatorViewStyle = :white.uiactivityindicatorstyle
    
    fetch_airquality
    
  end
  
  def will_appear
  end
  
  def fetch_airquality
    api_endpoint = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty"
    
    EM.schedule_on_main {
      
      AFMotion::HTTP.get(api_endpoint,
        sidoName: "서울",
        numOfRows: 50,
        pageNo: 1,
        ServiceKey: ENV['AIRKOREA_API_KEY']
      ) do |response|
        
        parse_airquality(response.body)
        
      end
    
    }
    
  end
  
  def parse_airquality(response)
    
    xml = Wakizashi::XML(response)
    
    @pm10value = xml.xpath("//item[stationName = '강남구']/pm10Value").first
    
    value = @pm10value.to_s.to_i
    
    if value < 30
      # view.styleClass = "aq-good"
    elsif value < 80
      # view.styleClass = "aq-moderate"
    elsif value < 120
      # view.styleClass = "aq-bad"
    else
      # view.styleClass = "aq-verybad"
    end
    
    set_title("강남구")
    set_airquality(value.to_s)
    
    
    set_last_updated(Time.now.strftime("Last updated at %p %I:%M"))
    
    @root.pullToRefreshView.stopAnimating
    
  end
  
  def set_last_updated(text)
    
    if @last_updated
      @last_updated.setText(text)
      
    else
      @last_updated = text.uilabel
      @last_updated.frame = [[0,0],[320,16]]
      # @last_updated.styleId = "aq-last-updated"
      # @last_updated.alpha = 0
      
      @root << @last_updated
      
      @last_updated.fade_in
      
    end
    
  end
  
  def set_title(text)
    
    if @title
      @title.setText(text)
      
    else
      @title = text.uilabel
      @title.frame = [[0,0],[320,20]]
      # @title.styleId = "aq-title"
      # @title.alpha = 0
      
      @root << @title
      
      @title.fade_in
      
    end
    
  end
  
  def set_airquality(text)
    
    if @value
      @value.setText(text)
      
      # Scale animation
      chain = UILabel.animation_chain
      chain << proc { @value.scale_to 1.2 }
      chain << proc { @value.scale_to 1 }
      chain.start
      
    else
      @value = text.uilabel
      @value.frame = [[0,0], [320,120]]
      # @value.styleId = "aq-value"
      # @value.alpha = 0
    
      @root << @value
      
      @value.fade_in
    end
    
  end
  
  def preferredStatusBarStyle
    UIStatusBarStyleLightContent
  end
  
end