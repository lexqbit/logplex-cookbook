require 'foodcritic'
require 'rubocop/rake_task'

desc 'Run RuboCop style and lint checks'
Rubocop::RakeTask.new(:rubocop)

desc 'Run Foodcritic lint checks'
FoodCritic::Rake::LintTask.new(:foodcritic) do |t|
  t.options = {
    fail_tags: ['any'],
    tags: []
  }
end

desc 'Run Test Kitchen integration tests'
task :integration do
  Kitchen.logger = Kitchen.default_file_logger
  Kitchen::Config.new.instances.each do |instance|
    instance.test(:always)
  end
end

# We cannot run Test Kitchen on Travis CI yet...
namespace :travis do
  desc 'Run tests on Travis'
  task ci: ['unit']
end

# The default rake task should just run it all
task default: ['travis:ci', 'integration']
