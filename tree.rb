def tree(height)
  i = 1

  (height-1).times do
    print " "
  end

  height.times do
    i.times do
      print "* "
    end

    puts ""
    (1..(height-i-1)).each do |i|
      print " "
    end
    i += 1
  end

end

tree(5)
tree(10)
tree(30)
