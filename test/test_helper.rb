ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

if ENV['COVERAGE']
  require 'simplecov'
  require 'simplecov-lcov'
  require 'coveralls'

  Coveralls.wear!

  SimpleCov::Formatter::LcovFormatter.config do |c|
    c.report_with_single_file = true
    c.single_report_path = 'coverage/lcov/lcov.info'
  end

  SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter

  SimpleCov.start do
    add_filter '/test/'
  end
end

class ActiveSupport::TestCase
  include AuthHelper
  include FactoryBot::Syntax::Methods
  parallelize(workers: :number_of_processors)
  fixtures :all
end
