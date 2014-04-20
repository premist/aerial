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
  app.provisioning_profile = ENV['PROVISIONING_PROFILE']
  app.codesign_certificate = ENV['CODESIGN_CERTIFICATE']
  
  app.pixatefreestyle.framework = 'vendor/PixateFreestyle.framework'
  app.interface_orientations = [:portrait]
  
  app.pods do
    pod 'SVPullToRefresh'
  end
  
end
