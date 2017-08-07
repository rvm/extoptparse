# Extoptparse

[![Gem Version](https://badge.fury.io/rb/extoptparse.png)](http://rubygems.org/gems/extoptparse)
[![Code Climate](https://codeclimate.com/github/rvm/extoptparse.png)](https://codeclimate.com/github/rvm/extoptparse)
[![Coverage Status](https://coveralls.io/repos/rvm/extoptparse/badge.png)](https://coveralls.io/r/rvm/extoptparse)
[![Build Status](https://travis-ci.org/rvm/extoptparse.png)](https://travis-ci.org/rvm/extoptparse)
[![Dependency Status](https://gemnasium.com/rvm/extoptparse.png)](https://gemnasium.com/rvm/extoptparse)
[![Inline docs](http://inch-ci.org/github/rvm/extoptparse.png)](http://inch-ci.org/github/rvm/extoptparse)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](http://rubydoc.info/github/rvm/extoptparse/master/frames)
[![Github Code](http://img.shields.io/badge/github-code-blue.svg)](https://github.com/rvm/extoptparse)
[![License](http://www.gnu.org/graphics/agplv3-88x31.png)](http://www.gnu.org/licenses/agpl.html)

Add grouping to Ruby's `OptionParser`

Extoptparse works with *ruby 1.9.3+*.

## Usage

```ruby
p = ExtOptParse.new
p.group(:group1) { p.on("-a", "A") }
p.group(:group2) { p.on("-b", "B") }
p.group(:group1) { p.on("-c", "C") }
puts p.help
       ...
       -b                               B
       -a                               A
       -c                               C
       ...
```

## Testing

```bash
rake
```

## License

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
