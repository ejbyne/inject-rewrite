class Array

  def inject_rewrite_iteration(*options, &block)
    array = self.dup
    return symbol_iteration_method(array, options)if options.any? { |option| option.is_a?(Symbol) }
    block_iteration_method(array, options[0], &block)
  end

  def inject_rewrite_recursion(*options, &block)
    array = self.dup
    return symbol_recursion_method(array, options) if options.any? { |option| option.is_a?(Symbol) }
    block_recursion_method(array, options[0], &block)
  end

  def symbol_iteration_method(array, options)
    symbol_proc = options.select{ |option| option.is_a?(Symbol) }.first.to_proc
    sum = select_symbol_initial_item(array, options)
    array.each { |n| sum = symbol_proc.call(sum, n) }
    return sum
  end

  def block_iteration_method(array, option, &block)
    sum = select_block_initial_item(array, option)
    array.each { |n| sum = yield(sum, n) }
    return sum
  end

  def symbol_recursion_method(array, options)
    symbol_proc = options.select{ |option| option.is_a?(Symbol) }.first.to_proc
    sum = select_symbol_initial_item(array, options)
    n = array[0]
    call_recursion(array, sum, n, &symbol_proc)
  end

  def block_recursion_method(array, option, &block)
    sum = select_block_initial_item(array, option)
    n = array[0]
    call_recursion(array, sum, n, &block)
  end

  def call_recursion(array, sum, n, &block)
    sum = block.call(sum, n)
    array.shift
    return sum if array.empty?
    call_recursion(array, sum, array[0], &block)
  end

  def select_symbol_initial_item(array, options)
    return options[0] if options[1].is_a?(Symbol)
    sum = array[0]
    array.shift
    return sum
  end

  def select_block_initial_item(array, option)
    unless option == nil
      sum = option
    else
      sum = array[0]
      array.shift
    end
    return sum
  end

end
