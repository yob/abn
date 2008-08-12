class ABN

  class Version #:nodoc:
    Major = 1
    Minor = 1
    Tiny  = 0
    
    String = [Major, Minor, Tiny].join('.')
    
    def self.to_s
      String
    end
  end

  def initialize(num)
    @number = num.to_s.tr ' ',''
  end

  def valid?
    return false unless @number.length == 11

    weights = [10, 1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
    sum = 0
    (0..10).each do |i|
      c = @number[i,1]
      sub = i.zero? ? 1 : 0
      digit = c.to_i - sub
      sum += weights[i] * digit
    end
    
    sum % 89 == 0 ? true : false
  end

  def to_s
    valid? ? "%s %s %s %s" % [@number[0,2], @number[2,3], @number[5,3], @number[8,3]] : ""
  end

  def self.valid?(abn)
    new(abn).valid?
  end
end
