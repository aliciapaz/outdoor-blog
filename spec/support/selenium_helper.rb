require 'selenium-webdriver'

def init_driver
  Capybara.current_driver = :selenium_chrome
  @driver = Capybara.current_driver
end

def quit_driver
  Capybara.use_default_driver
end
