require 'spec_helper'

describe DateTime do
  context "#to_i" do
    it "works" do
      DateTime.civil(2000).to_i.should == 946684800
    end
  end

  context "#to_f" do
    it "works" do
      DateTime.civil(1999,12,31,19,0,0,Rational(-5,24)).to_f.should == 946684800.0
    end
  end
end
