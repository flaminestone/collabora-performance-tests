require 'bundler/setup'
require_relative './static_data'
require_relative './pages/login_page'
require_relative '../lib/pages/collabora_page'
require_relative './pages/files_page'
require_relative './runners/simple_runner'
require_relative './runners/file_open_runner'
require 'onlyoffice_webdriver_wrapper'
require 'page-object'
require 'onlyoffice_file_helper'

class Manager
  include OnlyofficeWebdriverWrapper
  include PageObject
  attr_reader :instance

  def initialize
    @instance ||= OnlyofficeWebdriverWrapper::WebDriver.new(:chrome)
  end
  # ucs-4586.test.intranet
end