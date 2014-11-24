require 'inject-rewrite'

describe Array do

  let (:array) { [1, 2, 3, 4, 5] }
  
  context 'iteration' do
  
    it "can aggregate the elements of [1, 1] to return 2" do
      short_array = [1, 1]
      expect(short_array.inject_rewrite_iteration { |sum, n| sum + n }).to eq(2)
    end

    it "can aggregate the elements of [1, 2, 3, 4, 5] to return 15" do
      expect(array.inject_rewrite_iteration { |sum, n| sum + n }).to eq(15)
    end

    it "can multiply the elements of [1, 2, 3, 4, 5] to return 120" do
      expect(array.inject_rewrite_iteration { |sum, n| sum * n }).to eq(120)
    end

    it "can accept a starting number as an argument" do
      expect(array.inject_rewrite_iteration(5) { |sum, n| sum + n }).to eq(20)
    end

    it "works with strings" do
      string_array = ["Ed", "Sini", "Henry"]
      expect(string_array.inject_rewrite_iteration { |sum, n| sum + n }).to eq("EdSiniHenry")
    end

    it "can aggregate elements when passed the symbol :+" do
      expect(array.inject_rewrite_iteration(:+)).to eq(15)
    end

    it "can multiply elements when passed the symbol :*" do
      expect(array.inject_rewrite_iteration(:*)).to eq(120)
    end

    it "can take a starting number and the symbol :+" do
      expect(array.inject_rewrite_iteration(5, :+)).to eq(20)
    end

    it "can take a starting number and the symbol :*" do
      expect(array.inject_rewrite_iteration(5, :*)).to eq(600)
    end

    it "can find the longest word in an array" do
      string_array = ["Ed", "Sini", "Henry"]
      string_array.inject do |memo, word|
        memo.length > word.length ? memo : word
      end
    end

  end

  context 'recursion' do

    it "can aggregate the elements of [1, 1] to return 2" do
      short_array = [1, 1]
      expect(short_array.inject_rewrite_recursion { |sum, n| sum + n }).to eq(2)
    end

    it "can aggregate the elements of [1, 2, 3, 4, 5] to return 15" do
      expect(array.inject_rewrite_recursion { |sum, n| sum + n }).to eq(15)
    end

     it "can multiply the elements of [1, 2, 3, 4, 5] to return 120" do
      expect(array.inject_rewrite_recursion { |sum, n| sum * n }).to eq(120)
    end

    it "can accept a starting number as an argument" do
      expect(array.inject_rewrite_recursion(5) { |sum, n| sum + n }).to eq(20)
    end

    it "works with strings" do
      array = ["Ed", "Sini", "Henry"]
      expect(array.inject_rewrite_recursion { |sum, n| sum + n }).to eq("EdSiniHenry")
    end

  end

end