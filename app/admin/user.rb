ActiveAdmin.register User do

  action_item :only => :show do
    link_to('View on site', user_path(user))
  end

  form do |f|
    f.inputs "User Details" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin, :label => "Administrator"
      f.input :banned, :label => "Banned"
    end
    f.buttons
  end

  show do |user|
    attributes_table do
    row :id
    row :username
    row :email
    row :current_sign_in_at
    row :last_sign_in_at
    row :current_sign_in_ip
    row :last_sign_in_ip
    row :created_at
    row :updated_at
    row :admin
    row :banned
    end
    active_admin_comments
  end

  index do |user|
    selectable_column
    column "Id" do |user|
      link_to user.id, admin_user_path(user)
    end
    column :username
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip
    column :created_at
    column :updated_at
    column :admin
    column :banned
    default_actions
  end

  filter :username
  filter :email
  filter :current_sign_in_at
  filter :last_sign_in_at
  filter :current_sign_in_ip
  filter :last_sign_in_ip
  filter :created_at
  filter :updated_at
  filter :admin
  filter :banned

  create_or_edit = Proc.new {
    @user = User.find_or_create_by_id(params[:id])
    if params[:user][:password].blank?
      @user.update_without_password(params[:user], :as => :admin)
    else
      @user.update_attributes!(params[:user], :as => :admin)
    end
    if @user.save!
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit
end