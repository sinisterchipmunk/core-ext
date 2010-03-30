require 'spec_helper'

describe ActiveSupport::OrderedHash do
  context "#to_yaml" do
    subject do
      o = ActiveSupport::OrderedHash.new
      o[:one] = 1
      o[:two] = 2
      o
    end

    it "converts to yaml" do
      subject.to_yaml.should == "--- !map:ActiveSupport::OrderedHash \n:one: 1\n:two: 2\n"
    end
  end
end
