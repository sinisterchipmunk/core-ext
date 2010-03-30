require 'spec_helper'

describe Array do
  subject { [ 1, 2, "abc", "def", ["foo", "bar"], { 'baz' => '42' } ] }

  context "#%" do
    context "with another array" do
      it "results in an array intersection" do
        (subject % [1,2]).should == [1,2]
      end
    end

    context "with a non-array value" do
      it "results in elements equal to only that value" do
        (subject % 2).should == [2]
      end
    end
  end

  context "#deep_dup" do
    it "is not itself" do
      subject.deep_dup.should_not equal(subject)
    end

    it "elements are not themselves" do
      subject.deep_dup.each_with_index do |ele, index|
        subject[index].should_not equal(ele) unless ele.dup?.equal?(ele)
      end
    end

    it "hashes' keys are not themselves" do
      hash = subject.deep_dup.last
      hash.keys[0].should_not equal(subject.last.keys[0])
    end

    it "hashes' values are not themselves" do
      hash = subject.deep_dup.last
      hash.values[0].should_not equal(subject.last.values[0])
    end
  end
end
