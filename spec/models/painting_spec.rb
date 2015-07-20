require 'spec_helper'

describe Painting do
  let(:painting) { build(:painting) }
  subject { painting }
  
  it { should respond_to(:name)}
  it { should respond_to(:description)}
  it { should respond_to(:position)}
  it { should respond_to(:price_cents)}
  
  it "has a valid factory" do
    should be_valid
  end

  it { should validate_presence_of :name }

end