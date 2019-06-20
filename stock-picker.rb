def stock_picker(days)
    profit = 0
    max = 0
    output = []
    days.each_with_index do |price, index|
        for i in index + 1..days.length - 1 do
            current_price = days[i]
            if current_price - price > profit
                highest_index = i
                profit = current_price - price
            end
        end
        if profit > max
            output[0] = index
            output[1] = highest_index
            max = profit
        end
    end
    output
end

p stock_picker([17,3,6,9,15,8,6,1,10])
