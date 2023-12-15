mutex = Mutex.new
cv = ConditionVariable.new

a = Thread.new do
      mutex.synchronize do 
        print "A: Esta en una region critica, esperando por cv\n"
        cv.wait(mutex)
        print "A: Esta en la region critica de nuevo!. Sigue\n"
      end 
    end

print "En medio\n"

b = Thread.new do 
      mutex.synchronize do 
        puts "B: Esta en la region critica pero tiene a cv"
        cv.signal
        puts "B: Esta en la region critica, Saliendo"
      end 
    end

a.join
b.join

print "Al final\n"
