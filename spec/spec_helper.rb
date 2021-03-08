require 'capybara/rspec'
require_relative 'capybara_helper'
require "allure-rspec"

RSpec.configure do |config|
    config.include Capybara::DSL

    config.formatter = AllureRspecFormatter

    config.around do |example|
      puts '~> ' + example.metadata[:example_group][:full_description]
      # avoid looping over Capybara.drivers as it will also contain "selenium" generic driver and "rack_test" basic (js-less) browser
      [:chrome, :firefox].each do |browser|
        Capybara.current_driver = browser
        puts "~~> #{example.description} @ #{browser}"
        Allure.parameter("browser", browser)
        example.run
      end
    end

    config.after do

    end
end

AllureRspec.configure do |config|
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
end
