require 'selenium-webdriver'

def get_driver
  Capybara.current_driver = :rack_test
end

def quit_driver
  @driver.quit
  Capybara.use_default_driver
end