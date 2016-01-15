module PaintingsHelper
  
  def new_form?
    @painting.new_record?
  end
  
  def form_title
    new_form? ? "New Painting" : "Edit Painting"
  end
  
  def form_info_text
    action = new_form? ? "create a new" : "edit this"
    text = "Use the folloing form to #{action} painting."
    content_tag(:p,text)
  end
end
