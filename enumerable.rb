module Enumerable
    def my_each
        for value in 0..self.length - 1
            yield(self[value])
        end
    end

    def my_each_with_index
        for value in 0..self.length - 1
            yield(self[value], value)
        end
    end

    def my_select
        result = []
        self.my_each do |x|
            result << x if yield(x)
        end
        result
    end

    def my_all?
        self.my_each do |x|
            return false if !yield(x)
        end
        true
    end

    def my_any?
        self.my_each do |x|
            return true if yield(x)
        end
        false
    end

    def my_none?
        self.my_each do |x|
            return false if yield(x)
        end
        true
    end

    def my_count
        result = 0
        self.my_each do |x|
            result += 1 if yield(x)
        end
        result
    end

    def my_map(&my_proc)
        self.my_each_with_index do |x, index|
            self[index] = my_proc.call(x)
        end
        self
    end

    def my_inject
        result = nil
        self.my_each_with_index do |x, index|
            if index == 0
                result = x
                next
            end
            result = yield(result, x)
        end
        result
    end

end

def multiply_els(array)
    return array.my_inject { |num, x| num * x }
end

[1,2,3,4,5].my_each { |x| puts x * 2 }
[1,2,3,4,5].my_each_with_index { |x, index| puts "num #{x} index #{index}" }
p [1,2,3,4,5].my_select { |x| x < 3 }
p [1,2,3,4,5].my_all? { |x| x < 6 }
p [1,2,3,4,5].my_any? { |x| x > 4 }
p [1,2,3,4,5].my_none? { |x| x > 5 }
p [1,2,3,4,5].my_count { |x| x > 3 }
my_proc = Proc.new { |x| x * 3 }
p [1,2,3,4,5].my_map(&my_proc)
p [1,2,3,4,5].my_map { |x| x ** 2 }
p [1,2,3,4,5].my_inject { |num, x| num * x }
p multiply_els([2,4,5])