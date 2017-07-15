require "rubygems"
require "bundler"
Bundler.setup

require "abn"

describe ABN, "valid? class method" do
  it "should identify a valid ABN" do
    expect(ABN.valid?("12042168743")).to be_truthy
    expect(ABN.valid?(12042168743)).to   be_truthy
  end

  it "should identify a preformatted valid ABN" do
    expect(ABN.valid?("12 042 168 743")).to be_truthy
  end

  it "should have a problem with a pre-formatted invalid ABN" do
    expect(ABN.valid?("12 042 168 744")).to be_falsey
  end

  it "should have a problem with an invalid ABN" do
    expect(ABN.valid?("12042168744")).to be_falsey
    expect(ABN.valid?("902865")).to      be_falsey
  end

  it "should have a problem with invalid parameters" do
    expect(ABN.valid?(nil)).to       be_falsey
    expect(ABN.valid?(Array)).to     be_falsey
    expect(ABN.valid?(Array.new)).to be_falsey
  end

  it "should have a problem with invalid parameter type that has a #length of 11" do
    bad_parameter = (1..11).to_a
    expect(bad_parameter.length).to eql(11)
    expect(ABN.valid?(bad_parameter)).to be_falsey
  end
end

describe ABN, "to_s instance method" do
  it "should be able to format a valid ABN" do
    expect(ABN.new("12042168743").to_s).to eql("12 042 168 743")
  end

  it "should be able to return a pre-formatted ABN" do
    expect(ABN.new("12 042 168 743").to_s).to eql("12 042 168 743")
  end

  it "should not format invalid parameter" do
    expect(ABN.new(nil).to_s).to       eql("")
    expect(ABN.new(Array).to_s).to     eql("")
    expect(ABN.new(Array.new).to_s).to eql("")
  end

  it "should not format an invalid parameter type that has a #length of 11" do
    bad_parameter = (1..11).to_a
    expect(bad_parameter.length).to eql(11)
    expect(ABN.new(bad_parameter).to_s).to eql("")
  end

  it "should not format an invalid ABN" do
    expect(ABN.new("12042168744").to_s).to eql("")
    expect(ABN.new("902865").to_s).to eql("")
  end

  it "should not format an pre-formatted invalid ABN" do
    expect(ABN.new("12 042 168 744").to_s).to eql("")
  end
end
