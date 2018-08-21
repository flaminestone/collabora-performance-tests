require_relative '/lib/runners/simple_runner'

task :simple_runner do |_t|
  manager = Manager.new
  SimpleRunner.run(manager.instance)
end