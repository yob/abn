A small library for validating Australian Business Numbers (ABN)

# Installation

    gem install abn

# Usage

    require 'abn'

    ABN.new("12042168743").valid?
    => true

    ABN.valid?("12042168743")
    => true

    ABN.valid?("12042168744")
    => false

## With ActiveRecord

Version 1.3 of this gem had an active record mixin for validating ABN fields in
models. I removed it in version 2.0 to avoid complications of supporting active
record 2.x and 3.x (and Datamapper, Mongoid, etc).

To validate an ABN field in your model add the ABN gem to your Gemfile and
use the following pattern:

  class Business < ActiveRecord::Base

    validate :validate_abn

    private

    def validate_abn
      if self.abn.present && !ABN.valid?(self.abn)
        self.errors.add(:abn, "is not a valid ABN")
        false
      end
    end
  end

# Further Reading

- http://www.clearwater.com.au/code
- https://en.wikipedia.org/wiki/Australian_Business_Number
