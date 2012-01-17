require 'spec_helper'

describe Interrogate do

  it "should allow \"class interrogation\"" do
    String?("Hello").should == true
  end

  it "should allow \"class interrogation\" of multiple things" do
    String?("Hello", :World, 1.0).should == false
    String?("Hello", "World", "1.0").should == true
  end

  it "should allow interrogation of the return value of a block" do
    num = 2
    String? { num.to_s }.should == true
    String? { num }.should == false
  end

  it "should allow interrogation of the return value of a block and arguments" do
    num = 2
    String?("Hello", "World") { num.to_s }.should == true
    String?("Hello", "World") { num }.should == false
  end

  it "should raise an error when there are are no arguments provided" do
    lambda { String?() }.should raise_error(ArgumentError)
  end

end