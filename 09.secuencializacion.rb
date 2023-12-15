def fib(n)
  n < 2 ? n : fib(n-1) + fib(n-2)
end  

mutex = Mutex.new
resource = ConditionVariable.new

a = Thread.new do 
   mutex.synchronize do 
     fib(30) 
     # Thread 'a' now needs the resource
     puts "Thread 'a' now needs the resource"
     resource.wait(mutex)
     # 'a' can now have the resource
     puts "'a' can now have the resource"
   end 
end

b = Thread.new do
   mutex.synchronize do
     # Thread 'b' has finished using the resource
     puts "Thread 'b' has finished using the resource"
     resource.signal
   end
end

a.join
b.join
