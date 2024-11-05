#!/usr/bin/env ruby

require 'date'
require "optparse"

opt = OptionParser.new
argv_date = {}
opt.on('-y [DATE]') {|v| v } 
opt.on('-m [DATE]') {|v| v } 
opt.parse!(ARGV, into: argv_date)

if argv_date[:y]
  year = argv_date[:y].to_i
else
  year = Date.today.year
end
if argv_date[:y]
  month = argv_date[:m].to_i
else
  month = Date.today.month
end

puts "#{month}月 #{year}".center(20) 
puts "日 月 火 水 木 金 土"

start_date = Date.new(year,month)
end_date = Date.new(year,month,-1)

print "   "  * start_date.cwday 

(start_date..end_date).each do |date|
  everyday = date.strftime('%e') + " "
  if date.saturday?
    puts everyday
  else
    print everyday
  end
end
print "\n" 
