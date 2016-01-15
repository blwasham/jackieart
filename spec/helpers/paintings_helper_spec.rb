require 'spec_helper'
include PaintingsHelper

describe PaintingsHelper do
  
  let(:p_new) { build(:painting) }
  let(:p_edit) { create(:painting)}
  
  context "when new form" do
    before do
      controller.instance_variable_set(:@painting, p_new)
    end
    
    it "returns true for new record" do
      expect(helper.new_form?).to be true
    end
 
    it "returns new title" do
      expect(helper.form_title).to eq "New Painting"
    end
    
    it "returns new info text" do
      expect(helper.form_info_text).to include("create a new")
    end
  end
  context "when edit form" do
    before do
      controller.instance_variable_set(:@painting, p_edit)
    end
    
    it "returns false for new record" do
      expect(helper.new_form?).to be false
    end
    
    it "returns update title" do
      expect(helper.form_title).to eq "Edit Painting"
    end
    
    it "returns edit info text" do
      expect(helper.form_info_text).to include "edit this"
    end
  end
end