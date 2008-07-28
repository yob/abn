class ABN

  class Version #:nodoc:
    Major = 1
    Minor = 0
    Tiny  = 0
    
    String = [Major, Minor, Tiny].join('.')
  end

  def initialize(num)
    @number = num.to_s
  end

  def valid?
    ABN.valid? @number
  end

  def to_s
    "#{@number[0,2]} #{@number[2,3]} #{@number[5,3]} #{@number[8,3]}"
  end

  def self.valid?(abn)
    abn = abn.to_s
    return false unless abn.length == 11

    weights = [10, 1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
    sum = 0
    idx = 0
    abn.each_char do |c|
      idx == 0 ? sub = 1 : sub = 0
      digit = c.to_i - sub
      sum += weights[idx] * digit
      idx += 1
    end
    
    sum % 89 == 0 ? true : false
  end
  
end
