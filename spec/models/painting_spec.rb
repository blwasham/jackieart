require 'spec_helper'

describe Painting do
  
  let(:painting) { build(:painting) }
  
  describe "attributes and validations" do
    subject { painting }
  
    it { should be_valid}
    it { should respond_to(:name)}
    it { should respond_to(:description)}
    it { should respond_to(:position)}
    it { should respond_to(:price_cents)}
    it { should respond_to(:image_name)}
    it { should respond_to(:featured)}
  
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:image_name) }
    it { should validate_uniqueness_of(:image_name) }
    it "should be boolean" do 
      expect(subject.featured).to be_boolean
    end
  end
  
  describe "acts_as_list" do
    let!(:p1) { create(:painting) }
    let!(:p2) { create(:painting) }
    let!(:p3) { create(:painting) }
    
    it "increments postions on save" do
      expect(p2.position).to eq 3
    end
  end
end