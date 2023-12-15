def func1
  i = 0
  while i <= 2
     print "En la funcion 1 a las: #{Time.now}\n"
     sleep(2)
     i = i + 1
  end
end

def func2
  j = 0
  while j <= 2
     print "En la funcion 2 a las: #{Time.now}\n"
     sleep(1)
     j = j + 1
  end
end

print "Se empieza a las #{Time.now}\n"
t1 = Thread.new {func1}
t2 = Thread.new {func2}
t1.join
t2.join
print "Se acaba a las #{Time.now}\n"

