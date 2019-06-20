def substrings (phrase, array)
    output = Hash.new(0)
    phrase = phrase.downcase
    phrase.split(" ").each do |str|
        array.each do |word|
            match = /#{word}/.match(str)
            output[match[0]] += 1 if match
        end
    end
    output
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)

p substrings("Howdy partner, sit down! How's it going?", dictionary)