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

  create_or_edit = Proc.new {
    @user = User.find_or_create_by_id(params[:id])
    if params[:user][:password].blank?
      @user.update_without_password(params[:user], :as => :admin)
    else
      @user.update_attributes(params[:user], :as => :admin)
    end
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit
end