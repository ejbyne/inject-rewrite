class Array

def inject_rewrite(sum = nil, &block)
  array = self
  if sum == nil
    sum = array[0]
    array.shift
  end
  array.each do |n|
    sum = block.call(sum, n)
  end
  return sum
end

def inject_rewrite_recursion(sum = nil, &block)

  array = self
  sum = array[0]
  n = array[0]

  recursion = lambda do
    if array.length > 0
      sum = block.call(sum, n)
      array.shift
    end
  end

  sum = recursion.call(recursion.call(sum, n), n)

  # sum = block.call(sum, inject_rewrite_recursion(sum, self[n]))


  # # sum = block.call(sum, block.call(sum, self[n+1]))
  # sum = block.call(sum, array[n]) + block.call(sum, array[n+1])
  # return sum
end



end
