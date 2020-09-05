$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "zettel"

require "minitest/autorun"
require 'minitest/power_assert'
require "pry-byebug"

Pry.config.color = true
Pry.config.pager = false
Pry.config.correct_indent = false