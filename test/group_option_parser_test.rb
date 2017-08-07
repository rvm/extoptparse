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

require_relative "test_helper"
require "optparse"
require "group_option_parser"

describe GroupOptionParser do
  let(:klass) do
    Class.new(OptionParser) do
      include GroupOptionParser
    end
  end

  it :groups_options do
    p = klass.new("Usage: program [options]")
    p.on("--version", "VERSION")
    p.on_tail("--help", "HELP")
    p.group("a") { p.on("--a1", "A1") }
    p.group("b") { p.on("--b1", "B1") }
    p.group("a") { p.on("--a2", "A2") }
    p.group("b") { p.on("--b2", "B2") }
    p.send(:groups).must_equal(
      "tail" => 1,
      "top"  => -1,
      "a"    => 2,
      "b"    => 3,
    )


    p.help.must_equal(<<-MSG)
Usage: program [options]
        --version                    VERSION
        --b1                         B1
        --b2                         B2
        --a1                         A1
        --a2                         A2
        --help                       HELP
MSG

    p.remove("b")
    p.help.must_equal(<<-MSG)
Usage: program [options]
        --version                    VERSION
        --a1                         A1
        --a2                         A2
        --help                       HELP
    MSG

    p.remove
    p.help.must_equal(<<-MSG)
Usage: program [options]
        --a1                         A1
        --a2                         A2
        --help                       HELP
    MSG
  end
end
