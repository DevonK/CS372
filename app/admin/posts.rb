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

  show do |post|
    attributes_table do
      row :id
      row (:body) { |safe| raw(safe.body) }
      row :user
      row :topic
      row :created_at
      row :updated_at
      row :flagged
    end
    active_admin_comments
  end

  index do |post|
    selectable_column
    column :id do |post|
      link_to post.id, admin_post_path(post)
    end
    column (:body) { |safe| raw(safe.body) }
    column :user
    column :topic
    column :created_at
    column :updated_at
    column :flagged
    default_actions
  end
end
