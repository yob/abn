$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require 'spec'
require 'abn'

describe "The ABN class" do
  it "should identify a valid ABN" do
    ABN.valid?("12042168743").should be_true
    ABN.valid?(12042168743).should   be_true
  end
  
  it "should identify an invalid ABN" do
    ABN.valid?(nil).should       be_false
    ABN.valid?("902865").should  be_false
    ABN.valid?(Array).should     be_false
    ABN.valid?(Array.new).should be_false
  end

  it "should be able to pretty print a valid ABN" do
    ABN.new("12042168743").to_s.should eql("12 042 168 743")
  end

end
