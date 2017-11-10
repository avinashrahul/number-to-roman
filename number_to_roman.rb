require 'pry'
class NumberToRoman
  def initialize
    @roman_hash = {
        1 => 'I',
        5 => 'V',
        10 => 'X',
        50 => 'L',
        100 => 'C',
        500 => 'D',
        1000 => 'M'
    }
  end

  def convert_to_roman(number)
    # return if Base case true
    decimal = 1000
    result = ''
    # 667 => 500, 100, 50, 10, 5, 1, 1
    # 533 => 500, 10, 10, 10, 1, 1, 1
    while decimal > 0 do
      factor = number/decimal # 6
      # calculate multiple
      result += calculate_multiple(factor, decimal)
      number = number % decimal
      decimal = decimal/10
    end
    result
  end

  # 4, 9 is different
  def calculate_multiple(number, decimal)
    # for 522 => number = 5, decimal = 100.
    # number = 2, decimal = 10
    # number = 2, decimal = 1

    # below both cases we do not utilize number field
    # 44 is different -> 40, 4 -> XLIV (10 - 50, 1 - 5)
    # 99 is different -> 90, 9 -> XCIX (10 - 90, 1 - 9)
    case number
      when 0
        ''
      when (1..3)
        @roman_hash[decimal] * number
      when 4
        @roman_hash[decimal] + @roman_hash[decimal * 5]
      when 5
        @roman_hash[5 * decimal]
      when 6..8
        @roman_hash[5 * decimal] + (@roman_hash[decimal] * (number - 5))
      when 9
        @roman_hash[decimal] + @roman_hash[decimal * 10]
      else
        'Quit'
    end
  end
end

# @roman_hash[500] + @roman_hash[100] + @roman_hash[50] + @roman_hash[10] + @roman_hash[5] + @roman_hash[2]

n = NumberToRoman.new
puts "Enter Inout Number"
input = gets.strip
puts n.convert_to_roman(input.to_i)
