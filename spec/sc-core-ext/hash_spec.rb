require 'spec_helper'

describe Hash do
  it "#without" do
    { :a => 1, :b => 2, :c => 3 }.without(:a, :b).should == {:c => 3}
  end

  it "#stringify_values" do
    { :a => 1, :b => 2 }.stringify_values.should == { :a => '1', :b => '2' }
  end

  context "#keys?" do
    it "should be true" do
      { :a => 1, :b => 2, :c => 3 }.keys?(:b, :c).should == true
    end

    it "should be false" do
      { :a => 1, :b => 2, :c => 3 }.keys?(:a, :d).should == false
    end
  end

  it "#without_values" do
    { :a => 1, :b => 1, :c => 2, :d => 2}.without_values(1).should == {:c => 2, :d => 2}
  end

  it "#optionalize" do
    { :a => nil, :b => nil, :c => 1, :d => 2 }.optionalize.should == { :c => 1, :d => 2}
  end

  it "#camelize_keys" do
    { :hello_world => 1, :goodbye_john => 2}.camelize_keys.should == { 'HelloWorld' => 1, 'GoodbyeJohn' => 2 }
  end

  it "#rename" do
    { :a => 1, :b => 2 }.rename(:a => :b, :b => :c).should == { :b => 1, :c => 2 }
  end

  context "#deep_dup" do
    subject { { 'baz' => '42' } }
    
    it "is not itself" do
      subject.deep_dup.should_not equal(subject)
    end

    it "keys are not themselves" do
      subject.deep_dup.keys[0].should_not equal(subject.keys[0])
    end

    it "values are not themselves" do
      subject.deep_dup.values[0].should_not equal(subject.values[0])
    end
  end
end
