ActiveAdmin.register Topic do
  action_item :only => :show do
    link_to('View on site', topic_path(topic))
  end

  form do |f|
    f.inputs "User Details" do
      f.input :user
      f.input :title
      f.input :content
      f.input :tags
    end
    f.buttons
  end
end
