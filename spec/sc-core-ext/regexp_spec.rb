require 'spec_helper'

describe Regexp do
  before(:each) { @demo_text = "123abc\n asdf0987 \na1234"}

  it "should yield all matches in a multiline regexp" do
    @rx = /([0-9]+)/m
    yielded = 0
    @rx.each_match(@demo_text) { |y| yielded += 1 }
    yielded.should == 3
  end

  it "should return all matches in a multiline regexp" do
    @rx = /([0-9]+)/m
    @rx.each_match(@demo_text).collect { |m| m[0] }.should == %w(123 0987 1234)
  end
end
