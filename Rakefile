=begin
Copyright 2017 Michal Papis <mpapis@gmail.com>

This file is part of extoptparse.

Extoptparse is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Extoptparse is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with extoptparse.  If not, see <http://www.gnu.org/licenses/>.
=end

default_tasks = []

begin
  require "yard"
  YARD::Rake::YardocTask.new do |t|
    t.files   = ["lib/**/*.rb"]
    t.stats_options = ["--list-undoc", "--compact"]
  end

  task :docs    => [:yard]
  default_tasks << :yard
rescue LoadError
end

require "rake/testtask"
Rake::TestTask.new do |t|
  t.verbose = true
  t.libs.push("test")
  t.pattern = "test/**/*_test.rb"
end
default_tasks << :test

begin
  require "rubocop/rake_task.rb"
  RuboCop::RakeTask.new do |t|
    t.patterns = %w[lib/]
  end
  unless ENV["CI"]
    default_tasks << :rubocop
  end
rescue LoadError
end

task :default => default_tasks
