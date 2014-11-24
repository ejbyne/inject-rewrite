class Array

  def inject_rewrite_iteration(sum = nil, &inject_block)
    array = self
    if sum.is_a?(Symbol)
      symbol_proc = sum.to_proc
      sum = array[0]
      array.shift
      array.each do |n|
        sum = symbol_proc.call(sum, n)
      end
      return sum
    else
      if sum == nil
        sum = array[0]
        array.shift
      end
      array.each do |n|
        sum = yield(sum, n)
      end
    return sum
    end
  end

  def inject_rewrite_recursion(sum = nil, &inject_block)
    array = self
    if sum == nil
      sum = array[0]
      array.shift
    end
    n = array[0]

    recursion_proc = Proc.new do |array, sum, n|
      sum = inject_block.call(sum, n)
      array.shift
      n = array[0]
      if array.length == 0
        return sum
      else
        recursion_proc.call(array, sum, n)
      end
    end

    recursion_proc.call(array, sum, n)
  end

end
