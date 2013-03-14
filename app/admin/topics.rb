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
  show do |topic|
    attributes_table do
      row :id
      row :title
      row (:content) { |safe| raw(safe.content) }
      row :user
      row :created_at
      row :updated_at
      row :flagged
    end
    active_admin_comments
  end

  index do |topic|
    selectable_column
    column "Id" do |topic|
      link_to topic.id, admin_topic_path(topic)
    end
    column :title
    column (:content) { |safe| raw(safe.content) }
    column :user
    column :created_at
    column :updated_at
    column :flagged
    default_actions
  end
end
