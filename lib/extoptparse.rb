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

require "optparse"
require "group_option_parser"

# Add grouping to Ruby's `OptionParser`
#
# Example:
#
#     p = ExtOptParse.new
#     p.group(:group1) { p.on("-a", "A") }
#     p.group(:group2) { p.on("-b", "B") }
#     p.group(:group1) { p.on("-c", "C") }
#     puts p.help
#
#       ...
#       -b                               B
#       -a                               A
#       -c                               C
#       ...
#
# @see OptionParser
class ExtOptParse < OptionParser
  include GroupOptionParser
end
