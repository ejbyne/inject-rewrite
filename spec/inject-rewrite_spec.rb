require 'inject-rewrite'

describe Array do
  
  it "can aggregate the values of [1, 1] to return 2" do
    array = [1, 1]
    expect(array.inject_rewrite { |sum, n| sum + n }).to eq(2)
  end


end