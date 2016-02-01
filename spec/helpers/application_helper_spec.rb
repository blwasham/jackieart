require 'spec_helper'
include ApplicationHelper

describe ApplicationHelper do
  let!(:p) { create(:painting)}
  
  describe "edit_link" do
    context "when valid painting" do
      it "returns linked edit icon" do
        is_expected.to have_link('link_text', href: 'url')
      end  
    end
    context "when invalid painting" do
      it "returns nil"
    end
  end
  
  describe "destroy_link" do
    context "when valid painting" do
      it "returns linked edit icon"
    end
    context "when invalid painting" do
      it "returns nil"
    end    
  end
end