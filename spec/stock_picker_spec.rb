require 'spec_helper'

describe 'spec_picker method for stock prices' do
  it 'should return a pair of days representing the best day to buy and the best day to sell' do
    expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
  end
end
