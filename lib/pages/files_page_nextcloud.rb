require_relative './../../lib/manager'
class FilesPageNextcloud
  def initialize; end

  def create_folder_and_open(instance)
    @instance = instance
    click_to_button_new
    folder_name = click_new_folder_with_rand_name
    open_folder(folder_name)
  end

  def create_document_and_open(instance)
    @instance = instance
    click_to_button_new
    document_name = click_new_document_with_rand_name
    open_document(document_name)
  end

  def open_performance_folder(instance)
    @instance = instance
    open_folder(StaticData::PERFORMANCE_FOLDER)
  end

  def click_to_button_new
    @instance.wait_until_element_visible('//*[@class="button new"]')

    button_new_element = @instance.get_element('//*[@class="button new"]')
    button_new_element.click
    @instance.wait_until_element_visible('//*[@class="newFileMenu popovermenu bubble open menu"]')
  end

  def click_new_folder_with_rand_name
    folder_selector = @instance.get_element('//*[@id="controls"]/div[2]/div[2]/ul/li[2]/a')

    folder_selector.click
    sleep 0.5
    inpute_element = @instance.get_element('//*[@id="view15-input-folder"]')
    folder_name = Random.new_seed
    @instance.set_text_to_iframe(inpute_element, folder_name)
    @instance.send_keys(inpute_element, :return)
    @instance.wait_until_element_visible("//*[@id='fileList']/*[@data-file='#{folder_name}']")
    folder_name
  end

  def get_folder_id(name)
    @instance.get_element("//*[@id='fileList']/*[@data-file='#{name}']").attribute('data-id')
  end

  def open_folder(name)
    id = get_folder_id(name)
    @instance.open(StaticData::SERVER + "/owncloud/index.php/apps/files/?dir=/#{name}&fileid=#{id}")
  end

  def click_new_document_with_rand_name
    document_selector = @instance.get_element('//*[@id="body-user"]/div[6]/ul/li[3]/a')
    document_selector.click
    sleep 0.5
    inpute_element = @instance.get_element('//*[@id="view9-input-x-office-document"]')
    document_name = Random.new_seed
    @instance.set_text_to_iframe(inpute_element, document_name)
    @instance.send_keys(inpute_element, :return)
    document_name
  end

  def open_document(name)
    @instance.wait_until_element_visible("//span[contains(text(), '#{name}')]")
    file = @instance.get_element("//span[contains(text(), '#{name}')]")
    file.click
    puts "document #{name} opened"
  end

  def submit_and_wait
    submit_element = @instance.get_element('//*[@id="submit"]')
    submit_element.click
    @instance.wait_until_element_visible('//*[@id="controls"]')
  end
end



