#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-
# stub: EXTOPTPARSE ruby lib

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

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "extoptparse/version"

Gem::Specification.new do |s|
  s.license  = "AGPL-3.0"
  s.email    = ["mpapis@gmail.com"]
  s.authors  = ["Michal Papis"    ]
  s.version  = EXT_OPT_PARSE_VERSION.dup
  s.name     = "extoptparse"
  s.summary  = "Extended Ruby's OptionParser with grouping of options."
  s.homepage = "https://github.com/rvm/extoptparse"
  s.files    = Dir["lib/**/*.rb", "*.md", "LICENSE"]
  s.required_ruby_version     = ">= 1.9.3"
  s.required_rubygems_version = ">= 2.0.0"
  s.add_development_dependency("rake",     "~> 12.0")
  s.add_development_dependency("rubocop",  "~> 0.49") if RUBY_VERSION>="2.0.0"
  s.add_development_dependency("minitest", "~> 5.10")
  s.add_development_dependency("minitest-reporters", "~> 1.1")
  # s.add_development_dependency("smf-gem")
end
