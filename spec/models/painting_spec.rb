require 'spec_helper'

describe Painting do
  let(:painting) { build(:painting) }
  
  subject { painting }
  
  it { should be_valid}
  it { should respond_to(:name)}
  it { should respond_to(:description)}
  it { should respond_to(:position)}
  it { should respond_to(:price_cents)}
  it { should respond_to(:image_name)}
  
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:image_name) }
  it { should validate_uniqueness_of(:image_name) }

end