require 'spec_helper'
describe PaintingsController do
  let(:p1) { create(:painting)}
  let(:p2) { create(:painting)}
  let(:p3) { create(:painting)}
  
  describe "POST #load" do
    before do
      post :load, format: :json
    end
    
    it "renders load" do
      expect(response).to render_template(:load)
    end
    
    it "assigns paintings in expected order" do
      expect(assigns(:paintings)).to eq [p1,p2,p3]
    end
  end
  
  describe "POST #reorder" do
    before do
      p1
      p2
      p3
      post :reorder, {id: p1, position: 2}
    end
    
    it "assigns painting to passed in id" do
      expect(assigns(:painting)).to eq(p1)
    end
    
    it "changes p1 to position 2" do
      expect(assigns(:painting).position).to eq 2
    end
    
  end
end