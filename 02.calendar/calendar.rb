#!/usr/bin/env ruby

require 'date'
require 'optparse'

opt = OptionParser.new
argv_date = {}
opt.on('-y [DATE]') { |v| v }
opt.on('-m [DATE]') { |v| v }
opt.parse!(ARGV, into: argv_date)

year = argv_date[:y] ? argv_date[:y].to_i : Date.today.year
month = argv_date[:m] ? argv_date[:m].to_i : Date.today.month

puts "#{month}月 #{year}".center(20)
puts '日 月 火 水 木 金 土'

start_date = Date.new(year, month)
end_date = Date.new(year, month, -1)

print '   ' * start_date.wday

(start_date..end_date).each do |date|
  print date.strftime('%e')
  print date.saturday? ? "\n" : ' '
end
print "\n"
