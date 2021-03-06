require_relative './../../lib/manager'
require 'onlyoffice_file_helper'

class FilesPage
  include OnlyofficeFileHelper
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
    open_document(document_name.to_s)
  end

  def open_performance_folder(instance)
    @instance = instance
    open_folder(StaticData::PERFORMANCE_FOLDER)
  end

  def upload_document_and_open(instance, filename)
    @instance = instance
    upload_document(filename)
    open_document(filename)
  end

  def upload_document(filename)
    sleep 2
    file_path = File.join(File.dirname(__FILE__).split('/lib')[0], "assets/documents/#{filename}")
    @instance.type_to_locator('//*[@id="file_upload_start"]', file_path, false, false, false, true)
    wait_document_visible(filename)
  end

  def click_to_button_new
    @instance.wait_until_element_visible('//*[@class="button new"]')
    button_new_element = @instance.get_element('//*[@class="button new"]')
    button_new_element.click
    @instance.wait_until_element_visible('//*[@class="newFileMenu popovermenu bubble menu open menu-left"]')
    puts 'Button //*[@class="newFileMenu popovermenu bubble menu open menu-left"] visible'
  end

  def click_new_folder_with_rand_name
    puts 'get element //*[@id="controls"]/div[2]/div[2]/ul/li[4]/a'
    sleep 1
    folder_selector = @instance.get_element('//*[@id="controls"]/div[2]/div[2]/ul/li[2]/a')
    puts 'click to it'
    folder_selector.click
    @instance.wait_until_element_visible('//*[@id="view15-input-folder"]')
    inpute_element = @instance.get_element('//*[@id="view15-input-folder"]')
    folder_name = Random.new_seed.to_s
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
    @instance.open(StaticData::SERVER + "/apps/files/?dir=/#{name}&fileid=#{id}")
  end

  def click_new_document_with_rand_name
    puts '++++++++++++++++++click_new_document_with_rand_name'
    document_selector = @instance.get_element('//*[@id="controls"]/div[2]/div[2]/ul/li[4]/a')
    document_selector.click
    sleep 0.5
    inpute_element = @instance.get_element('//*[@id="view15-input-x-office-document"]')
    document_name = Random.new_seed.to_s
    @instance.set_text_to_iframe(inpute_element, document_name)
    @instance.send_keys(inpute_element, :return)
    puts '-------------------click_new_document_with_rand_name'
    document_name
  end

  def open_document(name)
    wait_document_visible(name)
    file = @instance.get_element("//span[contains(text(), '#{File.basename(name, '.*')}')]")
    file.click
    puts "document #{name} opened"
  end

  def wait_document_visible(name)
    puts "Wail for file with name <<#{name}>>"
    @instance.wait_until_element_visible("//span[contains(text(), '#{File.basename(name, '.*')}')]")
    puts "File with name <<#{name}>> is visible"
  end

  def submit_and_wait
    submit_element = @instance.get_element('//*[@id="submit"]')
    submit_element.click
    @instance.wait_until_element_visible('//*[@id="controls"]')
  end
end



