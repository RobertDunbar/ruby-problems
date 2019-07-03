def bubble_sort(this_array)
    complete = false
    while !complete
        complete = true
        this_array.each_with_index do |num, index|
            next if index == this_array.size - 1
            if this_array[index + 1] < num
                this_array[index], this_array[index + 1] = this_array[index + 1], this_array[index]
                complete = false
            end
        end
    end
    this_array
end

def bubble_sort_by(this_array)
    complete = false
    while !complete
        complete = true
        this_array.each_with_index do |num, index|
            next if index == this_array.size - 1
            if yield(this_array[index + 1], num) < 0
                this_array[index], this_array[index + 1] = this_array[index + 1], this_array[index]
                complete = false
            end
        end
    end
    this_array
end

p bubble_sort([4,3,78,2,0,2])
p bubble_sort_by(["hi","hello","hellooo", "hey", "h"]) { |left,right| left.length - right.length }