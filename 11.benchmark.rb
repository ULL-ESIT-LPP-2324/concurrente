require 'benchmark'

def inc(n)
  n + 1
end

Benchmark.bm(7) do |x|
  x.report("Process:") {  
    sum = 0
    100.times do |i|
      fork do
        10_000.times {sum = inc(sum)}
      end
    end
    Process.waitall
  }

  x.report("Threads:") {  
    sum = 0
    threads = (1..100).collect do
      Thread.new do
        10_000.times {sum = inc(sum)}
      end
    end
    threads.each{ |t| t.join}
  }
end

Benchmark.bm(7) do |x|
  x.report("for:")   {  
    sum = 0
    threads = (1..100).collect do
      Thread.new do
        for i in 1.. 10_000 do
          sum = inc(sum)
        end 
      end
    end

    threads.each{ |t| t.join}
  }
  x.report("times:") { 
    sum = 0
    threads = (1..100).collect do
      Thread.new do
        10_000.times {sum = inc(sum)}
      end
    end

    threads.each{ |t| t.join}
  }
  x.report("upto:")  { 
    sum = 0
    threads = (1..100).collect do
      Thread.new do
        1.upto(10_000) {sum = inc(sum)}
      end
    end

    threads.each{ |t| t.join}
  }
end
