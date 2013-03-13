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
         panel "Recent Posts" do
          ul do
             Post.last(5).map do |post|
               li link_to(post.body[0..50]+ "...", admin_post_path(post))
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

        column do
          panel "Flagged Topics" do
            ul do
              Topic.where(:flagged => true).map do |topic|
               li link_to(topic.title, admin_topic_path(topic))
             end
            end
          end
        end

        column do
          panel "Flagged Posts" do
            ul do
              Post.where(:flagged => true).map do |post|
                li link_to(post.body[0..50]+ "...", admin_post_path(post))
                end
            end
          end
        end

    end
  end
end
