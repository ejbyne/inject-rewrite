class Array

def inject_rewrite(&block)
  sum = self[0]
  modified_array = self
  modified_array.shift
  modified_array.each do |n|
    sum = block.call(sum, n)
  end
  return sum
end

end