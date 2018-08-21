require 'onlyoffice_webdriver_wrapper'
class TestOne
  include OnlyofficeWebdriverWrapper

  def initialize
    @instance = OnlyofficeWebdriverWrapper::WebDriver.new(:chrome)
    @instance.open('google.com')
    @instance.wait_until_element_visible('//*[@id="user"]')
  end
end
TestOne.new
p