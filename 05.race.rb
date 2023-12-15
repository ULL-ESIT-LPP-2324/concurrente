def inc(n)
  n + 1
end

sum = 0
threads = (1..10).collect do
   Thread.new do
     10_000.times do
        sum = inc(sum)
     end
   end
end

threads.each{ |t| t.join}
p sum
