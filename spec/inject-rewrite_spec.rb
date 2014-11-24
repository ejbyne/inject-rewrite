require 'inject-rewrite'

describe Array do

  let (:array) { [1, 2, 3, 4, 5] }
  
  context 'iteration' do
  
    it "can aggregate the elements of [1, 1] to return 2" do
      short_array = [1, 1]
      expect(short_array.inject_rewrite_iteration { |sum, n| sum + n }).to eq(short_array.inject { |sum, n| sum + n })
    end

    it "can aggregate the elements of [1, 2, 3, 4, 5] to return 15" do
      expect(array.inject_rewrite_iteration { |sum, n| sum + n }).to eq(array.inject { |sum, n| sum + n })
    end

    it "can multiply the elements of [1, 2, 3, 4, 5] to return 120" do
      expect(array.inject_rewrite_iteration { |sum, n| sum * n }).to eq(array.inject { |sum, n| sum * n })
    end

    it "can accept a starting number as an argument" do
      expect(array.inject_rewrite_iteration(5) { |sum, n| sum + n }).to eq(array.inject(5) { |sum, n| sum + n })
    end

    it "works with strings" do
      string_array = ["Ed", "Sini", "Henry"]
      expect(string_array.inject_rewrite_iteration { |sum, n| sum + n }).to eq(string_array.inject { |sum, n| sum + n })
    end

    it "can aggregate elements when passed the symbol :+" do
      expect(array.inject_rewrite_iteration(:+)).to eq(array.inject(:+))
    end

    it "can multiply elements when passed the symbol :*" do
      expect(array.inject_rewrite_iteration(:*)).to eq(array.inject(:*))
    end

    it "can take a starting number and the symbol :+" do
      expect(array.inject_rewrite_iteration(5, :+)).to eq(array.inject(5, :+))
    end

    it "can take a starting number and the symbol :*" do
      expect(array.inject_rewrite_iteration(5, :*)).to eq(array.inject(5, :*))
    end

    it "can find the longest word in an array" do
      string_array = ["Ed", "Sini", "Henry"]
      expect(string_array.inject_rewrite_iteration { |memo, word| memo.length > word.length ? memo : word }).to eq(string_array.inject { |memo, word| memo.length > word.length ? memo : word })
    end

  end

  context 'recursion' do

    it "can aggregate the elements of [1, 1] to return 2" do
      short_array = [1, 1]
      expect(short_array.inject_rewrite_recursion { |sum, n| sum + n }).to eq(short_array.inject { |sum, n| sum + n })
    end

    it "can aggregate the elements of [1, 2, 3, 4, 5] to return 15" do
      expect(array.inject_rewrite_recursion { |sum, n| sum + n }).to eq(array.inject { |sum, n| sum + n })
    end

     it "can multiply the elements of [1, 2, 3, 4, 5] to return 120" do
      expect(array.inject_rewrite_recursion { |sum, n| sum * n }).to eq(array.inject { |sum, n| sum * n })
    end

    it "can accept a starting number as an argument" do
      expect(array.inject_rewrite_recursion(5) { |sum, n| sum + n }).to eq(array.inject(5) { |sum, n| sum + n } )
    end

    it "works with strings" do
      array = ["Ed", "Sini", "Henry"]
      expect(array.inject_rewrite_recursion { |sum, n| sum + n }).to eq(array.inject { |sum, n| sum + n })
    end

        it "can aggregate elements when passed the symbol :+" do
      expect(array.inject_rewrite_recursion(:+)).to eq(array.inject(:+))
    end

    it "can multiply elements when passed the symbol :*" do
      expect(array.inject_rewrite_recursion(:*)).to eq(array.inject(:*))
    end

    it "can take a starting number and the symbol :+" do
      expect(array.inject_rewrite_recursion(5, :+)).to eq(array.inject(5, :+))
    end

    it "can take a starting number and the symbol :*" do
      expect(array.inject_rewrite_recursion(5, :*)).to eq(array.inject(5, :*))
    end

    it "can find the longest word in an array" do
      string_array = ["Ed", "Sini", "Henry"]
      expect(string_array.inject_rewrite_recursion { |memo, word| memo.length > word.length ? memo : word }).to eq(string_array.inject { |memo, word| memo.length > word.length ? memo : word })
    end

  end

end