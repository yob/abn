class ABN

  class Version #:nodoc:
    Major = 1
    Minor = 1
    Tiny  = 0
    
    String = [Major, Minor, Tiny].join('.')
  end

  def initialize(num)
    @number = num.to_s.tr ' ','' if [String, Bignum].include? num.class
  end

  def valid?
    return false unless @number && @number.length == 11

    weights = [10, 1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
    sum = 0
    (0..10).each do |i|
      c = @number[i,1]
      digit = c.to_i - (i.zero? ? 1 : 0)
      sum += weights[i] * digit
    end
    
    sum % 89 == 0 ? true : false
  end

  def to_s
    valid? ? "%s%s %s%s%s %s%s%s %s%s%s" % @number.split('') : ""
  end

  def self.valid?(abn)
    new(abn).valid?
  end
end
