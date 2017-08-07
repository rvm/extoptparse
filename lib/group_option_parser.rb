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

# Add grouping to Ruby's `OptionParser`
module GroupOptionParser

  # changes the target of all functions to be set by `group`
  def top
    @stack[current_top]
  end

  # @overload remove(name)
  #   allows removing last or group by `name`
  def remove(name=nil)
    if name
      remove_group(name)
    else
      remove_last
    end
  end

  # run block in context of a group,
  # if group does not exist it's created
  def group(name, &_block)
    self.current_top = group_index(name)
    yield self
    self.current_top = TOP_INDEX
  end

private

  TOP_INDEX = -1

  attr_writer :current_top

  def current_top
    @current_top ||= TOP_INDEX
  end

  def groups
    @groups ||= {
      "tail" => 1,
      "top"  => TOP_INDEX,
    }
  end

  def group_index(name)
    name = name.to_s
    groups[name] || new_group(name)
  end

  def new_group(name)
    index = last_index
    groups[name] = index
    @stack.insert(index, OptionParser::List.new)
    index
  end

  def remove_group(name)
    index = groups.delete(name.to_str)
    @stack.delete_at(index) if index
  end

  def remove_last
    name, _ = groups.rassoc(last_index)
    groups.delete(name) if name
    @stack.pop
  end

  def last_index
    @stack.size - 1
  end
end
