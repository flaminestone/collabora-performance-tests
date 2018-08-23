require_relative '../../lib/manager'
class FileOpenRunner
  def self.run(instance)
    @instance = instance
    @instance.headless.headless_instance.video.start_capture
    begin
      login
      open_performance_folder
      create_folder_and_open
      upload_document_and_open(StaticData::DOCUMENT_FOR_FILE_OPEN)
      wait_until_editor_open
      sleep 5
      scrolling
    end
    name = "FileOpenRunner_#{Time.now.to_s.tr(' ', '_')}.mov"
    @instance.headless.headless_instance.video.stop_and_save("assets/video/#{name}")
  end

  def self.login
    puts '[FileOpenRunner] login'
    LoginPage.new.login(@instance)
  end

  def self.create_folder_and_open
    puts '[FileOpenRunner] create_folder_and_open'
    FilesPage.new.create_folder_and_open(@instance)
  end

  def self.open_performance_folder
    puts '[FileOpenRunner] open_performance_folder'
    FilesPage.new.open_performance_folder(@instance)
  end

  def self.upload_document_and_open(filename)
    puts '[FileOpenRunner] upload_document_and_open'
    FilesPage.new.upload_document_and_open(@instance, filename)
  end

  def self.wait_until_editor_open
    puts '[FileOpenRunner] write_text'
    CollaboraPage.new.wait_until_editor_open(@instance)
  end

  def self.scrolling
    puts '[FileOpenRunner] scrolling'
    CollaboraPage.new.scrolling(@instance)
  end
end
# manager = Manager.new
# FileOpenRunner.run(manager.instance)