begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
    require 'capybara'
    require 'capybara/dsl'
    require 'capybara/cucumber'
    require 'capybara-screenshot/cucumber'
    
    #PTravel Settings
    ENV['EMAIL_VOLUNTEER']="voluntario@gmail.com"
    ENV['EMAIL_LEADER']="lider@gmail.com"
    ENV['EMAIL_CORETEAM']="coreteam@gmail.com"

    ENV['PSW']="123456"
    ENV['INV_PSW']="123455"
    
    Capybara.default_driver = :selenium
    
    # Set the host the Capybara tests should be run against
    Capybara.app_host = ENV["CAPYBARA_HOST"]
    
    # Set the time (in seconds) Capybara should wait for elements to appear on the page
    Capybara.default_max_wait_time = 15
    Capybara.default_driver = :selenium
    Capybara.app_host = "https://testing-start.web.app"
    
    class CapybaraDriverRegistrar
      # register a Selenium driver for the given browser to run on the localhost
      def self.register_selenium_driver(browser)
        Capybara.register_driver :selenium do |app|
          Capybara::Selenium::Driver.new(app, :browser => browser)
        end
      end
    
    end
    # Register various Selenium drivers
    #CapybaraDriverRegistrar.register_selenium_driver(:internet_explorer)
    #CapybaraDriverRegistrar.register_selenium_driver(:firefox)
    CapybaraDriverRegistrar.register_selenium_driver(:chrome)
    Capybara.run_server = false
    #World(Capybara)
    
    