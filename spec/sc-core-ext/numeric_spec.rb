require 'spec_helper'

describe Numeric do
	context "#max" do
		it "returns the argument if the argument is greater" do
			1.max(2).should == 2
		end

		it "returns itself if the argument is less" do
			1.max(2).should == 2
		end
	end

	context "#min" do
		it "returns itself if the argument is greater" do
			1.min(2).should == 1
		end

		it "returns the argument if the argument is less" do
			1.min(2).should == 1
		end
	end
end

