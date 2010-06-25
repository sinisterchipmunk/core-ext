require 'spec_helper'
require 'active_support/version'

describe ActiveSupport::OrderedHash do
  context "#to_yaml" do
    subject do
      o = ActiveSupport::OrderedHash.new
      o[:one] = 1
      o[:two] = 2
      o
    end

    it "converts to yaml" do
      if ActiveSupport::VERSION::MAJOR >= 3 || RUBY_VERSION > "1.8"
        yml = "--- !omap \n- :one: 1\n- :two: 2\n"
      else
        yml = "--- !map:ActiveSupport::OrderedHash \n:one: 1\n:two: 2\n"
      end

      subject.to_yaml.should == yml
    end
  end
end
