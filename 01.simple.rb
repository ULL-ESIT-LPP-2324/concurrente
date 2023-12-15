x = Thread.new do
  puts "x"
  puts "y"
  puts "z"
end

y = Thread.new do
  puts "a"
  puts "b"
  puts "c"
end

x.join
y.join