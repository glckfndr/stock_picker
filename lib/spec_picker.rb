def stock_picker(stock_prices)
  current_price = stock_prices[0]
  price_rate = []
  stock_prices.each_cons(2) do |element|
    price_rate << element[1] - element[0]
  end
  p price_rate
  interest = 0
  max_interest = 0
  i_start = 0
  res = []
  price_rate.each_with_index do |rate, i|
    if rate >= 0
      i_start = i if interest.zero?
      interest += rate
    else
      if interest > max_interest
        res += [i_start, i]
        max_interest = interest
      end
      interest = 0

    end
  end

  res = [i_start, stock_prices.length - 1] if interest > max_interest

  res
end
