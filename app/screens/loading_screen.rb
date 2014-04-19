class LoadingScreen < PM::Screen

  def on_load
    view.styleId = "loading"
    
    fetch_airquality
  end

  def will_appear
    
    @title =  "aerial".uilabel
    @title.frame = [[0,0], [320,40]]
    @title.styleId = "loading-title"
    
    view << @title
    
    @activity = UIActivityIndicatorView.large.startAnimating
    @activity.styleId = "activity-indicator"
    
    view << @activity
  end
  
  def preferredStatusBarStyle
    UIStatusBarStyleLightContent
  end
  
  def fetch_airquality
    api_key="BW5UvN5YMS0HvyNLY3G9KwNteJPOdCYL1TCqaEBqmKHYt1IGmq9H+dKuLUJTeC1WsNUgg3jIeeNykvfAGA5Fhw=="
    AFMotion::HTTP.get("http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty", sidoName: "서울", numOfRows: 50, pageNo: 1, ServiceKey: api_key) do |response|
      
      parse_airquality(response.body)
    end
    
  end
  
  def parse_airquality(response)
    
    xml = Wakizashi::XML(response)
    
    pm10value = xml.xpath("//item[stationName = '강남구']/pm10Value").first
    
    sleep(3)
    
    open_modal HomeScreen.new(
      pm10value: pm10value,
      transition_style: UIModalTransitionStyleFlipHorizontal,
      presentation_style: UIModalPresentationFormSheet)
    
  end

end
