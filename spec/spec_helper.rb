require "gmo-payment-carrier"
require "pry"
require "ffaker"
require 'simplecov'
require "codeclimate-test-reporter"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  CodeClimate::TestReporter::Formatter
]
SimpleCov.start
CodeClimate::TestReporter.start

RSpec.configure do |config|
end
