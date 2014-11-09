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

end
