ActiveAdmin.register Post do
  action_item :only => :show do
    link_to('View on site', topic_path(post.topic_id))
  end
  action_item :only => :show do
    link_to('Remove Flag', unflag_topic_post_path(post))
  end

  form do |f|
    f.inputs "Post Details" do
      f.input :body
    end
    f.buttons
  end
end
