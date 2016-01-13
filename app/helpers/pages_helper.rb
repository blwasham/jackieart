module PagesHelper
  def featured?
    Painting.featured.pluck(:id).present?
  end
  def featured(painting)
    content_tag (:div) do
      cl_image_tag(painting.image_name, crop: :fill)
    end  
  end
end