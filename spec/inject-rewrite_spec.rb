require 'inject-rewrite'

describe Array do
  
  context 'iteration' do
  
    it "can aggregate the elements of [1, 1] to return 2" do
      array = [1, 1]
      expect(array.inject_rewrite { |sum, n| sum + n }).to eq(2)
    end

    it "can aggregate the elements of [1, 2, 3, 4, 5] to return 15" do
      array = [1, 2, 3, 4, 5]
      expect(array.inject_rewrite { |sum, n| sum + n }).to eq(15)
    end

    it "can multiply the elements of [1, 2, 3, 4, 5] to return 120" do
      array = [1, 2, 3, 4, 5]
      expect(array.inject_rewrite { |sum, n| sum * n }).to eq(120)
    end

    it "can accept a starting number as an argument" do
      array = [1, 2, 3, 4, 5]
      expect(array.inject_rewrite(5) { |sum, n| sum + n }).to eq(20)
    end

    it "works with strings" do
      array = ["Ed", "Sini", "Henry"]
      expect(array.inject_rewrite { |sum, n| sum + n }).to eq("EdSiniHenry")
    end

  end

  context 'recursion' do

    it "can aggregate the elements of [1, 1] to return 2" do
      array = [1, 1]
      expect(array.inject_rewrite_recursion { |sum, n| sum + n }).to eq(2)
    end

  end

end