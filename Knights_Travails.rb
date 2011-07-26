#!/usr/bin/env ruby
require 'lib/kt'

kt = KT.new ARGV.slice!(0), ARGV.slice!(0), ARGV 
puts kt.find_path