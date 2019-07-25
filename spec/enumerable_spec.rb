require "./enumerable.rb"

RSpec.describe "Enumerable" do

    describe "#my_each" do
        it "interates through each element" do
            test = []
            [1,2,3,4,5,6].my_each { |x| test << x + 1}
            expect(test).to eql([2,3,4,5,6,7])
        end
    end

    describe "#my_each_with_index" do
        it "interates through each element with index" do
            test = []
            [1,2,3,4,5,6].my_each_with_index { |x, i| test << x << i }
            expect(test).to eql([1,0,2,1,3,2,4,3,5,4,6,5])
        end
    end

    describe "#my_select" do
        it "interates through and selects on condition" do
            test = []
            test = [1,2,3,4,5,6].my_select { |x| x > 3 }
            expect(test).to eql([4,5,6])
        end
    end

    describe "#my_all?" do
        it "interates through and checks for all condition met" do
            expect([1,2,3,4,5,6].my_all? { |x| x < 7 }).to eql(true)
        end
    end

    describe "#my_any?" do
        it "interates through and checks for any condition met true" do
            expect([1,2,3,4,5,6].my_any? { |x| x == 6 }).to eql(true)
        end

        it "interates through and checks for any condition met false" do
            expect([1,2,3,4,5,6].my_any? { |x| x == 7 }).to eql(false)
        end
    end

    describe "#my_none?" do
        it "interates through and checks for no condition met" do
            expect([1,2,3,4,5,6].my_none? { |x| x > 7 }).to eql(true)
        end
    end

    describe "#my_count" do
        it "interates through and counts num items meet condition" do
            expect([1,2,3,4,5,6].my_count { |x| x > 3 }).to eql(3)
        end
    end

    describe "#my_map" do
        it "works with number multiplication" do
            expect([1,2,3,4,5,6].my_map { |x| x * 2 }).to eql([2,4,6,8,10,12])
        end

        it "works with letters" do
            expect(%w[a b c d e f g].my_map { |x| x + "y" }).to eql(%w[ay by cy dy ey fy gy])
        end
    end

    describe "#my_inject" do
        it "correctly passes forward sum of calculation" do
            expect([1,2,3,4,5,6].my_inject { |sum, x| sum * x }).to eql(720)
        end
    end
end