ActiveAdmin.register Topic do
  action_item :only => :show do
    link_to('View on site', topic_path(topic))
  end
  action_item :only => :show do
    link_to('Remove Flag', unflag_topic_path(topic))
  end

  form do |f|
    f.inputs "Topic Details" do
      f.input :user
      f.input :title
      f.input :content
      f.input :tags
    end
    f.buttons
  end
end
