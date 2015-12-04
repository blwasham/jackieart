module PagesHelper
  def featured?
    Painting.featured.pluck(:id).present?
  end
  def featured_carousel
    ret = ""
    for painting in @featured
      ret =  content_tag (:div) do
        cl_image_tag(painting.image_name, crop: :fill)
      end
      #<div><img data-lazy="<%#= asset_path('paintings/Nightfall.jpg') %>" /></div>
      
    end
    return ret
  end
end
