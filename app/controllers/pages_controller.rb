class PagesController < ApplicationController
  def index
  end
  def gallery
    @paintings = Painting.gallery_listing
  end
  def about
  end
end
