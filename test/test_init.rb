# require_relative '../init'

# unless ENV['BOOTSTRAP'] == 'off'
#   require 'test_bench/bootstrap'; TestBench::Bootstrap.activate
# else
#   require 'test_bench'; TestBench.activate
# end

# require 'test_bench/controls'
# require 'test_bench/fixtures'

# include

# Load the code to be tested
require_relative '../lib/zettel.rb'

# Load TestBench
require 'test_bench'

# Activate TestBench
TestBench.activate