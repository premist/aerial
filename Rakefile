# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rubygems'
require 'yaml'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  
  # config
  config = YAML.load_file('config.yml')
  config.each do |key, value|
    app.env[key] = value
  end
  
  app.name = 'aerial'
  app.identifier = 'com.premist.aerial'
  app.provisioning_profile = config['PROVISIONING_PROFILE']
  app.codesign_certificate = config['CODESIGN_CERTIFICATE']
  
  # Change to false when deploying to TestFlight
  app.entitlements['get-task-allow'] = true
  
  app.device_family = [:iphone]
  app.interface_orientations = [:portrait]
  
  app.pods do
    pod 'SVPullToRefresh'
  end
  
  app.vendor_project('vendor/PRTMCoordTrans', :xcode)
  
  app.development do
    
    app.testflight do
      app.testflight.sdk = 'vendor/TestFlightSDK'
      app.testflight.app_token = config['TESTFLIGHT_APP_TOKEN']
      app.testflight.api_token = config['TESTFLIGHT_API_TOKEN']
      app.testflight.team_token = config['TESTFLIGHT_TEAM_TOKEN']
      app.testflight.notify = true
      app.testflight.identify_testers = true
    end
  end
  
end
