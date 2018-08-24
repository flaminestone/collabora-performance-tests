require_relative 'lib/manager'

task :simple_runner do |_t|
  manager = Manager.new
  SimpleRunner.run(manager.instance)
end

task :file_open_runner do |_t|
  manager = Manager.new
  FileOpenRunner.run(manager.instance)
  puts 'Wait for file getting'
  `sh`
end

task :file_open_and_write_runner do |_t|
  manager = Manager.new
  FileOpenAndWriteRunner.run(manager.instance)
  puts 'Wait for file getting'
  `sh`
end