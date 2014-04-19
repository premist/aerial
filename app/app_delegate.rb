class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    PixateFreestyle.currentApplicationStylesheet.monitorChanges = true
    open LoadingScreen.new
  end
  
end
