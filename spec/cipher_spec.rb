require "./cipher.rb"

RSpec.describe "Cipher" do
    describe "#caesar_cipher" do
        it "works with one character" do
            expect(caesar_cipher("a", 1)).to eql("b")
        end

        it "works with upercase character" do
            expect(caesar_cipher("A", 1)).to eql("B")
        end

        it "wraps around correctly" do
            expect(caesar_cipher("Zz", 1)).to eql("Aa")
        end

        it "special characters untouched" do
            expect(caesar_cipher("!", 1)).to eql("!")
        end

        it "words with mixed letters" do
            expect(caesar_cipher("Dog", 1)).to eql("Eph")
        end

        it "multiple words" do
            expect(caesar_cipher("Dog dog", 1)).to eql("Eph eph")
        end

        it "multiple words and special chars" do
            expect(caesar_cipher("!Dog dog!", 1)).to eql("!Eph eph!")
        end
    end
end