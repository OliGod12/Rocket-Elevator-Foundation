ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    panel "IBM WATSON" do
      render 'ibm_watson'
    end

    panel "Star Wars Planet Facts" do
      render 'star_wars_facts'
    end
    
    panel "Map" do
      render 'google_map'
    end


    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end

    # end
    # line_chart   Content.pluck("download").uniq.map { |c| { title: c, data: Content.where(download: c).group_by_day(:updated_at, format: "%B %d, %Y").count }  }, discrete: true
    # column_chart Content.group_by_hour_of_day(:updated_at, format: "%l %P").order(:download).count, {library: {title:'Downloads for all providers'}}
    # column_chart Content.group(:title).order('download DESC').limit(5).sum(:download)
    
    # line_chart result.each(:as => :hash) { |item|
    #   {name: item.title, data: item.sum_download.count}
    # }




    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #           Lead.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
