#!/usr/bin/env ruby

require 'date'
require "optparse"

#コマンドラインで年月を指定
opt = OptionParser.new
argv_date = {}
opt.on('-y [DATE]') {|v| v } 
opt.on('-m [DATE]') {|v| v } 
opt.parse!(ARGV, into: argv_date)

#表示する年月の紐づけ
if argv_date[:y] != nil && argv_date[:m] != nil
    #年月を指定
    year = argv_date[:y].to_i
    month = argv_date[:m].to_i
elsif argv_date[:y] != nil && argv_date[:m] == nil
    #年のみ指定
    year = argv_date[:y].to_i
    month = Date.today.month 
elsif argv_date[:y] == nil && argv_date[:m] != nil 
    #月のみ指定
    year = Date.today.cwyear 
    month = argv_date[:m].to_i
else
    #指定なしのため今月と今年を紐づけ
    year = Date.today.cwyear 
    month = Date.today.month 
end

#年月、曜日の表示
puts "#{month}月 #{year}".center(20) 
puts "日 月 火 水 木 金 土".center(13)   

#月初と月末を作る
month_start = Date.new(year,month) 
month_end = Date.new(year,month,-1) 

#月初の位置調整
case month_start.cwday 
    when 1
        print "   " 
    when 2
        print "      " 
    when 3
        print "         " 
    when 4
        print "            " 
    when 5
        print "               " 
    when 6
        print "                  " 
end

#日付を表示
calendar = (month_start..month_end).to_a 
calendar.each do |x| 
    if x.saturday?
        puts x.strftime('%e') + " "
    else
        print x.strftime('%e') + " "
    end
end
print "\n" #カレンダー末尾の％を消す
