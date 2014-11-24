class Array

  def inject_rewrite_iteration(first_option = nil, second_option = nil, &inject_block)
    array = self
    if first_option == nil && second_option == nil
      sum = array[0]
      array.shift
    elsif first_option.is_a?(Symbol)
      symbol_proc = first_option.to_proc
      sum = array[0]
      array.shift
    elsif second_option.is_a?(Symbol)
      symbol_proc = second_option.to_proc
      if first_option == nil
        sum = array[0]
        array.shift
      else
        sum = first_option
      end
    elsif first_option != nil
      sum = first_option
    end
    array.each do |n|
      if block_given?
        sum = yield(sum, n)
      elsif symbol_proc
        sum = symbol_proc.call(sum, n)
      end
    end
    return sum
  end

  #   array = self
  #   if sum.is_a?(Symbol)
  #     symbol_proc = sum.to_proc
  #     sum = array[0]
  #     array.shift
  #     array.each do |n|
  #       sum = symbol_proc.call(sum, n)
  #     end
  #     return sum
  #   else
  #     if sum == nil
  #       sum = array[0]
  #       array.shift
  #     end
  #     array.each do |n|
  #       sum = yield(sum, n)
  #     end
  #   return sum
  #   end
  # end

  def inject_rewrite_recursion(sum = nil, &inject_block)
    array = self
    if sum == nil
      sum = array[0]
      array.shift
    end
    n = array[0]

    recursion_proc = Proc.new do |array, sum, n|
      sum = yield(sum, n)
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
