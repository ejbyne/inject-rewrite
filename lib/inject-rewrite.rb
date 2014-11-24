class Array

  def inject_rewrite_iteration(*options, &block)
    array = self.dup
    options.map { |option| block = option.to_proc if option.is_a?(Symbol) }
    sum = initial_sum(array, options)
    array.shift if options[0].is_a?(Symbol) || options.empty?
    array.each { |n| sum = block.call(sum, n) }
    return sum
  end

  def inject_rewrite_recursion(*options, &block)
    array = self.dup
    options.map { |option| block = option.to_proc if option.is_a?(Symbol) }
    sum = initial_sum(array, options)
    array.shift if options[0].is_a?(Symbol) || options.empty?
    n = array[0]
    call_recursion(array, sum, n, &block)
  end

  def initial_sum(array, options)
    return array[0] if options[0].is_a?(Symbol) || options.empty?
    return options[0] if !options[0].is_a?(Symbol) && !options[0].nil?
  end

  def call_recursion(array, sum, n, &block)
    sum = block.call(sum, n)
    array.shift
    return sum if array.empty?
    call_recursion(array, sum, array[0], &block)
  end

end
