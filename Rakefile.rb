require_relative 'lib/manager'

task :simple_runner do |_t|
  manager = Manager.new
  SimpleRunner.run(manager.instance)
end