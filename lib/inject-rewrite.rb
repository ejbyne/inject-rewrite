class Array

def inject_rewrite(&block)
  sum = 0
  self.each do |n|
    sum = block.call(sum, n)
  end
  return sum
end

end