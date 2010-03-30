require 'spec_helper'

describe String do
  it "#dehumanize" do
    "say_hello_to_the_world".camelize.dehumanize.should == "sayHelloToTheWorld"
    "Say hello to the world".dehumanize.should == "say_hello_to_the_world"
  end

  context "#hex_to_bin" do
    subject { "61 62 63" }

    it "converts hex to binary" do
      subject.hex_to_bin.should == "abc"
    end
  end

  context "#indent" do
    subject { "hello\nworld".indent }

    it "indents the first character" do
      subject[0].should == ?\t
    end

    it "indents after newline characters" do
      subject[subject.index(?\n) + 1].should == ?\t
    end
  end

  context "#parenthesize" do
    it "parenthesizes with one character" do
      'text'.parenthesize(':').should == ":text:"
    end

    it "parenthesizes with two characters" do
      'text'.parenthesize('[]').should == "[text]"
    end

    it "parenthesizes with defaults" do
      "text".parenthesize.should == "(text)"
    end
  end

  context "#depunctuate" do
    it "does not include question marks" do
      "kind_of?".depunctuate.should == "is_kind_of"
    end

    it "does not include exclamation points" do
      "save!".depunctuate.should == "force_save"
    end

    it "returns itself if no punctuation is found" do
      "save".depunctuate.should == "save"
    end
  end
end
