# frozen_string_literal: true

class ABN

  module Version #:nodoc:
    Major = 2
    Minor = 1
    Tiny  = 1

    String = [Major, Minor, Tiny].join('.')
  end

  # Creates an ABN object representing the ABN number passed
  # as the only parameter.
  def initialize(num)
    @number = num.to_s.tr ' ',''
  end

  # Returns whether the current ABN class represents a
  # valid ABN number according to a weighting
  # algorithm (not checked against a datbase)
  def valid?
    return false unless @number.length == 11

    weights = [10, 1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
    sum = 0
    (0..10).each do |i|
      c = @number[i,1]
      digit = c.to_i - (i.zero? ? 1 : 0)
      sum += weights[i] * digit
    end

    sum % 89 == 0 ? true : false
  end

  # Correctly formats the represented ABN if valid, else returns
  # an empty string
  def to_s
    valid? ? "%s%s %s%s%s %s%s%s %s%s%s" % @number.split('') : ""
  end

  # Accepts an ABN number as a String or Bignum and returns
  # whether or not it is valid (not checked against a database)
  def self.valid?(abn)
    new(abn).valid?
  end
end
