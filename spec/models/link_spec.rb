require 'spec_helper'

describe Link do
  it { should validate_presence_of :url }
  it { should allow_mass_assignment_of(:url) }

  it { should belong_to :user }
end

describe Link do
  context "on create" do
    let(:link) { build(:link) }

    before { link.save }

    it "should generate unique key" do
      link.key.should be
    end

    it { link.key.length.should == 8 }
  end
end

describe Link do
  let(:link) { build(:link) }

  it { link.short.should_not be }

  context "on create" do
    before { link.save }

    it "should provide short version of url using key" do
      link.short.should == "/#{link.key}"
    end
  end
end

