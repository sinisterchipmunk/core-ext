describe Float do
  context "#to_frac" do
    context "1.0" do
      subject { 1.0 }
      it("== 1") { subject.to_frac.should == "1" }
    end
  
    context "1.25" do
      subject { 1.25 }
      it("== 1 1/4") { subject.to_frac.should == "1&frac14;" }
    end

    context "1.5" do
      subject { 1.5 }
      it("== 1 1/2") { subject.to_frac.should == "1&frac12;" }
    end

    context "1.75" do
      subject { 1.75 }
      it("== 1 3/4") { subject.to_frac.should == "1&frac34;" }
    end

    context "1.88" do
      subject { 1.88 }
      it("== 1.88") { subject.to_frac.should == '1.88' }
    end
  end
end
