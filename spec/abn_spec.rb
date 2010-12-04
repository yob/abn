$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'spec'
require 'abn'

describe "The ABN class" do
  it "should identify a valid ABN" do
    ABN.valid?("12042168743").should be_true
    ABN.valid?(12042168743).should   be_true
  end

  it "should identify a preformatted valid ABN" do
    ABN.valid?("12 042 168 743").should be_true
  end

  it "should have a problem with a pre-formatted invalid ABN" do
    ABN.valid?("12 042 168 744").should be_false
  end

  it "should have a problem with an invalid ABN" do
    ABN.valid?("12042168744").should be_false
    ABN.valid?("902865").should      be_false
  end

  it "should have a problem with invalid parameters" do
    ABN.valid?(nil).should       be_false
    ABN.valid?(Array).should     be_false
    ABN.valid?(Array.new).should be_false
  end

  it "should have a problem with invalid parameter type that has a #length of 11" do
    bad_parameter = (1..11).to_a
    bad_parameter.length.should eql(11)
    ABN.valid?(bad_parameter).should be_false
  end

  it "should be able to format a valid ABN" do
    ABN.new("12042168743").to_s.should eql("12 042 168 743")
  end

  it "should be able to return a pre-formatted ABN" do
    ABN.new("12 042 168 743").to_s.should eql("12 042 168 743")
  end

  it "should not format invalid parameter" do
    ABN.new(nil).to_s.should       eql("")
    ABN.new(Array).to_s.should     eql("")
    ABN.new(Array.new).to_s.should eql("")
  end

  it "should not format an invalid parameter type that has a #length of 11" do
    bad_parameter = (1..11).to_a
    bad_parameter.length.should eql(11)
    ABN.new(bad_parameter).to_s.should eql("")
  end

  it "should not format an invalid ABN" do
    ABN.new("12042168744").to_s.should eql("")
    ABN.new("902865").to_s.should eql("")
  end

  it "should not format an pre-formatted invalid ABN" do
    ABN.new("12 042 168 744").to_s.should eql("")
  end
end
