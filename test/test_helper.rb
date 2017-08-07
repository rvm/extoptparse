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

require "rubygems"
require "minitest"

# fix lib in LOAD_PATH and load version for gems manipulation
lib = File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

if
  RUBY_VERSION.start_with?("2.4") && # check Gemfile
  $0 != "-e" # do not do that in guard
then
  require "coveralls"
  require "simplecov"

  SimpleCov.start do
    formatter SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::HTMLFormatter,
      Coveralls::SimpleCov::Formatter,
    ])
    command_name "Unit Tests"
    add_filter "/test/"
  end

  Coveralls.noisy = true unless ENV["CI"]
end

# Ensure all files are counted in
Dir[lib+"/**/*.rb"].each{|file| require file }


require "minitest/autorun" unless $0=="-e" # skip in guard
require "minitest/unit"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
