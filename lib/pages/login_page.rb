require_relative './../../lib/manager'
class LoginPage
  def initialize; end

  def login(instance)
    @instance = instance
    open_login_page
    input_login
    input_password
    submit_and_wait
  end

  def open_login_page
    @instance.open(StaticData::SERVER + '/owncloud/index.php/login')
    @instance.wait_until_element_visible('//*[@id="user"]')
  end

  def input_login
    inpute_element = @instance.get_element('//*[@id="user"]')
    @instance.set_text_to_iframe(inpute_element, StaticData::LOGIN)
  end

  def input_password
    inpute_element = @instance.get_element('//*[@id="password"]')
    @instance.set_text_to_iframe(inpute_element, StaticData::PASSWORD)
  end

  def submit_and_wait
    submit_element = @instance.get_element('//*[@id="submit"]')
    submit_element.click
    @instance.wait_until_element_visible('//*[@id="controls"]')
  end
end
