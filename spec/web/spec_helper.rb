ENV["RACK_ENV"] = "test"
require_relative '../../app'
raise "test database doesn't end with test" unless DB.opts[:database] =~ /test\z/

require 'capybara'
require 'capybara/dsl'
require 'capybara/apparition'
require 'rack/test'

require_relative '../minitest_helper'

Capybara.app = MyTodo.freeze.app
Capybara.default_driver = :apparition

class Minitest::HooksSpec
  include Rack::Test::Methods
  include Capybara::DSL

  def app
    Capybara.app
  end

  after do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
