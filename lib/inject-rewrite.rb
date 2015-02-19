class Array

  def inject_rewrite_iteration(*options, &block)
    array = self.dup
    sum = initial_sum(array, options)
    block = symbol_to_block(options) if options.any?{ |option| option.is_a?(Symbol) }
    return iterative_method(array, sum, &block)
  end

  def inject_rewrite_recursion(*options, &block)
    array = self.dup
    sum = initial_sum(array, options)
    block = symbol_to_block(options) if options.any?{ |option| option.is_a?(Symbol) }
    return recursive_method(array, sum, array[0], &block)
  end

  def initial_sum(array, options)
    return options[0] if !options[0].nil? && !options[0].is_a?(Symbol)
    return array.shift if options[0].nil? || options[0].is_a?(Symbol)
  end

  def symbol_to_block(options)
    options.select{ |option| option.is_a?(Symbol) }.first.to_proc 
  end

  def iterative_method(array, sum, &block)
    array.each { |n| sum = block.call(sum, n) }
    return sum
  end

  def recursive_method(array, sum, n, &block)
    sum = block.call(sum, n)
    array.shift
    return sum if array.empty?
    recursive_method(array, sum, array[0], &block)
  end

end
