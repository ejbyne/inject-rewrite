class Array

  def inject_rewrite_iteration(first_option = nil, second_option = nil, &inject_block)
    array = self.dup
    if first_option.is_a?(Symbol) || second_option.is_a?(Symbol)
      symbol_method(array, first_option, second_option)
    else
      block_method(array, first_option, &inject_block)
    end
  end

  def symbol_method(array, first_option, second_option)
    symbol_proc = create_symbol_proc(first_option, second_option)
    sum = select_symbol_initial_item(array, first_option, second_option)
    array.each do |n|
      sum = symbol_proc.call(sum, n)
    end
    return sum
  end

  def block_method(array, first_option, &inject_block)
    sum = select_block_initial_item(array, first_option)
    array.each do |n|
      sum = yield(sum, n)
    end
    return sum
  end

  def create_symbol_proc(first_option, second_option)
    [first_option, second_option].select{ |option| option.is_a?(Symbol) }.first.to_proc
  end

  def select_symbol_initial_item(array, first_option, second_option)
    if second_option.is_a?(Symbol)
      sum = first_option
    else
      sum = array[0]
      array.shift
    end
    return sum
  end

  def select_block_initial_item(array, first_option)
    unless first_option == nil
      sum = first_option
    else
      sum = array[0]
      array.shift
    end
    return sum
  end

  #   array = self.dup
  #   if first_option == nil && second_option == nil
  #     sum = array[0]
  #     array.shift
  #   # elsif first_option.is_a?(Symbol)
  #   #   symbol_proc = first_option.to_proc
  #   #   sum = array[0]
  #   #   array.shift
  #   # elsif second_option.is_a?(Symbol)
  #   #   symbol_proc = second_option.to_proc
  #     # if first_option == nil
  #     #   sum = array[0]
  #     #   array.shift
  #     # else
  #   #   #   sum = first_option
  #   #   end
  #   # elsif first_option != nil
  #   #   sum = first_option
  #   # end
  #   array.each do |n|
  #     if block_given?
  #       sum = yield(sum, n)
  #     elsif symbol_proc
  #       sum = symbol_proc.call(sum, n)
  #     end
  #   end
  #   return sum
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
