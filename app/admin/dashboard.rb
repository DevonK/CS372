ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

     columns do
       column do
         panel "Recent Topics" do
          ul do
             Topic.last(5).map do |topic|
               li link_to(topic.title, admin_topic_path(topic))
             end
           end
         end
       end

        column do
          panel "Recent Users" do
            ul do
              User.last(5).map do |user|
                li link_to(user.username, admin_user_path(user))
              end
            end
          end
        end
      end
  end
end
