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
    sum = options[1].is_a?(Symbol) ? options[0] : array[0]
    array.shift unless options[1].is_a?(Symbol)
    array.each { |n| sum = symbol_proc.call(sum, n) }
    return sum
  end

  def block_iteration_method(array, option, &block)
    sum = option == nil ? array[0] : option
    array.shift if option == nil
    array.each { |n| sum = yield(sum, n) }
    return sum
  end

  def symbol_recursion_method(array, options)
    symbol_proc = options.select{ |option| option.is_a?(Symbol) }.first.to_proc
    sum = options[1].is_a?(Symbol) ? options[0] : array[0]
    array.shift unless options[1].is_a?(Symbol)
    n = array[0]
    call_recursion(array, sum, n, &symbol_proc)
  end

  def block_recursion_method(array, option, &block)
    sum = option == nil ? array[0] : option
    array.shift if option == nil
    n = array[0]
    call_recursion(array, sum, n, &block)
  end

  def call_recursion(array, sum, n, &block)
    sum = block.call(sum, n)
    array.shift
    return sum if array.empty?
    call_recursion(array, sum, array[0], &block)
  end

end
