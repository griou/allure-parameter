Capybara.configure do |config|
  config.default_driver = :chrome
end

Capybara.register_driver :chrome do |driver|
  Capybara::Selenium::Driver.new driver, browser: :chrome
end

Capybara.register_driver :firefox do |driver|
  Capybara::Selenium::Driver.new driver, browser: :firefox
end