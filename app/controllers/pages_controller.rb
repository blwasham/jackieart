class PagesController < ApplicationController
  def index
  end
  def featured
    @featured = Painting.featured
    redirect_to :gallery if @featured.empty?
  end
  def gallery
    @paintings = Painting.gallery_listing
  end
  def about
  end
end
