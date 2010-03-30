require 'spec_helper'

describe Object do
  context "#attr_boolean" do
    subject do
      obj = Object.new
      klass = (class << obj; self; end)
      klass.send(:attr_boolean, :new_record)
      obj
    end

    it("responds_to? accessor?") { subject.should respond_to(:new_record?) }
    it("responds_to? accessor=") { subject.should respond_to(:new_record=) }
  end

  context "#dup?" do
    context "with an undupable object" do
      subject { nil }
      it("returns itself") { subject.dup?.should be_equal(nil) }
    end

    context "with a dupable object" do
      subject { "hello" }
      it("does not return itself") { subject.dup?.should_not be_equal(subject) }
      it("== itself") { subject.dup?.should == subject }
    end
  end
end
