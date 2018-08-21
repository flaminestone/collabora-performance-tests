require_relative '../../lib/manager'
class SimpleRunner
  def self.run(instance)
    @instance = instance
    @instance.headless.headless_instance.video.start_capture
    login
    open_performance_folder
    create_folder_and_open
    create_document_and_open
    sleep 5
    write_text
    @instance.headless.headless_instance.video.stop_and_save("video/SimpleRunner_#{Time.now.to_s.tr(' ', '_')}.mov")
  end

  def self.login
    puts '[SimpleRunner] login'
    LoginPage.new.login(@instance)
  end

  def self.create_folder_and_open
    puts '[SimpleRunner] create_folder_and_open'
    FilesPage.new.create_folder_and_open(@instance)
  end

  def self.open_performance_folder
    puts '[SimpleRunner] open_performance_folder'
    FilesPage.new.open_performance_folder(@instance)
  end

  def self.create_document_and_open
    puts '[SimpleRunner] create_document_and_open'
    FilesPage.new.create_document_and_open(@instance)
  end

  def self.write_text
    puts '[SimpleRunner] write_text'
    CollaboraPage.new.write_text(@instance)
  end
end
# manager = Manager.new
# SimpleRunner.run(manager.instance)