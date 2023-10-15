def stock_picker(stock_prices)
  prices = [] # array for pairs of the best prices [[min,max],[,],[,]]
  stock_clone = stock_prices.clone
  loop do
    stock_tmp = stock_clone.clone
    min_price = stock_tmp.min
    max_price = min_price
    best_buy = best_sell = 0
    loop do # find interest for the the min_price
      best_buy = stock_tmp.index(min_price)
      max_price = stock_tmp.max
      best_sell = stock_tmp.index(max_price)

      break if best_buy < best_sell # best buy-sell is found

      stock_tmp.delete(max_price) # remove max_price placed before min_price
      break if stock_tmp.length == 1
    end
    prices << [min_price, max_price] if best_buy < best_sell
    stock_clone.delete(min_price) # remove min_price to find next min_price
    next unless stock_clone.length == 1
    return nil if prices.empty?

    prices.sort_by! { |el| el[1] - el[0] }
    return [stock_prices.index(prices.last[0]), stock_prices.index(prices.last[1])]
  end
end
