# I just wanted to add some notes as I reflect on this code.
# This was written a year ago as something to help me fully understand
# converting numbers to different bases as I was working through
# an assembly language course and it was something frequently done
# in that class.
# Today some of the things that I notice is that the class
# converts numbers and has a sole purpose dedicated to converting them
# but there is some ask don't tell going on and checking on type
# which tells me that the types need to be there own classes.
# The number class could be a factory creating the appropriate number class
# for the number passed and returning that instance to the user. maybe.
# I am thinking something in the initialize method that will return the
# proper number class so that the public interface remains untouched
# I would like to refactor this without changing a single test.

class Number
  def self.new number
    return create_number number
  end

  private

  def self.create_number number
    return Binary.new number if number_is_binary? number
    return Decimal.new number if number.is_a? Numeric
    Hexadecimal.new number
  end

  def self.number_is_binary? number
    return false if number.is_a? Numeric
    number.chars.all? { |char| char == '1' || char == '0' }
  end
end

class BaseNumber
  def initialize number
    @number = number
  end
end

class Binary < BaseNumber
  def to_decimal
    @number.to_i(2)
  end

  def to_binary
    @number
  end

  def to_hexadecimal
    @number.to_i(2).to_s(16)
  end
end

class Decimal < BaseNumber
  def to_decimal
    @number
  end

  def to_binary
    @number.to_s(2)
  end

  def to_hexadecimal
    @number.to_s(16)
  end
end

class Hexadecimal < BaseNumber
  def to_decimal
    @number.to_i(16)
  end

  def to_binary
    @number.to_i(16).to_s(2)
  end

  def to_hexadecimal
    @number
  end
end

class NumberHelper
  @@numbers = {"10" => "A", "11" => "B", "12" => "C", "13" => "D", "14" => "E", "15" => "F"}

  def self.binary_to_decimal number
    count = 0
    bit = number.length
    number.each_char do |c|
      bit -= 1
      count += (1*2**bit) if c == "1"
    end
    count
  end

  def self.hexadecimal_to_decimal number
    count = 0
    bit = number.length
    number.each_char do |c|
      bit -= 1
      number = (c.to_i == 0) ? letter_to_number(c) : c.to_i
      count += (number*16**bit)
    end
    count
  end

  def self.decimal_to_hexadecimal number
    hexadecimal = ""
    if number < 0
      negative = true
      number = number.abs
    end
    while number > 0
      hexadecimal.prepend(number_to_letter(number % 16))
      number = number / 16
    end
    hexadecimal = hex_twos_comp(hexadecimal) if negative
    hexadecimal
  end

  def self.decimal_to_binary number
    binary = ""
    while number > 0
      binary.prepend(number % 2 == 1 ? "1" : "0")
      number = number / 2
    end
    binary
  end

  private

  def self.hex_twos_comp hexadecimal
    twos_hex = []
    hexadecimal = [hexadecimal] unless hexadecimal.is_a? Array
    hexadecimal.each do |digit|
      number = @@numbers.include? digit ? letter_to_number(digit) : digit.to_i
      twos_hex << (15 - number) + 1
    end
    twos_hex.to_s
  end

  def self.letter_to_number(c)
    number = c.ord
    number - 55
  end

  def self.number_to_letter(n)
    return n.to_s if n < 10
    @@numbers[n.to_s] if (10..15).include? n
  end
end
