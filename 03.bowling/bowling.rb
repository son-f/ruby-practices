#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end
frames = []
shots.each_slice(2) { |s| frames << s }

point = 0
frames.each.with_index(1) do |frame, i|
  break if i == 11

  point += if frame[0] == 10
             frame.sum + frames[i].sum + (frames[i].first == 10 ? frames[i + 1].first : 0)
           elsif frame.sum == 10
             frame.sum + frames[i].first
           else
             frame.sum
           end
end
puts point
