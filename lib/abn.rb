class ABN

  module Version #:nodoc:
    Major = 1
    Minor = 3
    Tiny  = 0
    
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

module ABNValidations
  class << self
    def enable
      ActiveRecord::Base.extend ABNValidations
    end
  end


  # Validates whether the value of the specified attribute conforms to the Australian Business Number (ABN) format.
  # 
  # +validates_abn_correctness_of+ will automatically non-destructively strip any formatting and whitespace before 
  # validation
  def validates_abn_correctness_of(*args)

    # Set up our configuration for this validation
    configuration = { :on => :save, :allow_nil => false, :message => "is not a valid ABN" }
    configuration.update(args.extract_options!)

    # iterate through each field we've set up to validate the local numericality of
    validates_each(args, configuration) do |instance, attr_name, value|

      # get our raw value (ie, what was last sent to the instance...)
      raw_value = instance.send("#{attr_name}_before_type_cast") || value
    
      # skip our processing if we've got a legal nil...
      next if (configuration[:allow_nil] and raw_value.nil?)

      unless ABN.valid?(raw_value)
        instance.errors.add(attr_name, configuration[:message])
      end
    end
  end
end

if defined?(ActiveRecord)
  ABNValidations.enable
end