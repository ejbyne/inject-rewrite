class Array

  def inject_rewrite_iteration(first_option = nil, second_option = nil, &block)
    array = self.dup
    if first_option.is_a?(Symbol) || second_option.is_a?(Symbol)
      symbol_iteration_method(array, first_option, second_option)
    else
      block_iteration_method(array, first_option, &block)
    end
  end

  def inject_rewrite_recursion(first_option = nil, second_option = nil, &block)
    array = self.dup
    if first_option.is_a?(Symbol) || second_option.is_a?(Symbol)
      symbol_recursion_method(array, first_option, second_option)
    else
      block_recursion_method(array, first_option, &block)
    end
  end

  def symbol_iteration_method(array, first_option, second_option)
    symbol_proc = create_symbol_proc(first_option, second_option)
    sum = select_symbol_initial_item(array, first_option, second_option)
    array.each do |n|
      sum = symbol_proc.call(sum, n)
    end
    return sum
  end

  def block_iteration_method(array, first_option, &block)
    sum = select_block_initial_item(array, first_option)
    array.each do |n|
      sum = yield(sum, n)
    end
    return sum
  end

  def symbol_recursion_method(array, first_option, second_option)
    symbol_proc = create_symbol_proc(first_option, second_option)
    sum = select_symbol_initial_item(array, first_option, second_option)
    n = array[0]
    recursion(array, sum, n, &symbol_proc)
  end

  def block_recursion_method(array, first_option, &block)
    sum = select_block_initial_item(array, first_option)
    n = array[0]
    recursion(array, sum, n, &block)
  end

  def recursion(array, sum, n, &block)
    sum = block.call(sum, n)
    array.shift
    n = array[0]
    if array.length == 0
      return sum
    else
      recursion(array, sum, n, &block)
    end
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

end
