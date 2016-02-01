module ApplicationHelper  
  def edit_link(obj)
    obj_class = obj.class.name.downcase
    edit_path = "edit_" + obj_class + "_path"
    link_to send(edit_path, obj), class: "btn btn-default" do
      content_tag :i, nil, class: "fa fa-pencil-square-o"
    end
  end
  
  def destroy_link(obj)
    link_to obj, method: :delete, class: 'btn btn-danger', data: { confirm: 'Are you sure?' } do
      content_tag :i, nil, class: "fa fa-trash"
    end
  end
  
end
