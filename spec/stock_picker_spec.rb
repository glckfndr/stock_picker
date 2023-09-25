require 'spec_helper'
require_relative '../lib/spec_picker'

describe 'spec_picker method for stock prices' do
  describe 'calculates a pair of days representing the best day to buy and the best day to sell' do
    it 'should return first and last day' do
      expect(stock_picker([1, 3, 6, 9, 15])).to eq([0, 4])
    end

    it 'should return a pair when these days in the middle' do
      expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
    end

    it 'should return a pair when these days are the last' do
      expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 14])).to eq([7, 8])
    end

    it 'should return a pair of days when these days are first and the second' do
      expect(stock_picker([3, 6, 5, 4])).to eq([0, 1])
    end

    it 'should return a pair of days when price decreses, increases, decreses and increases' do
      expect(stock_picker([17, 3, 6, 9, 15, 8, 16, 1, 10])).to eq([1, 6])
    end

    it 'should return nil' do
      expect(stock_picker([17, 6, 3, 1])).to be_nil
    end
  end
end
