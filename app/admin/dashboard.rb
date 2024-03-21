# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Info" do
          para "There are #{ SupportingOrganisation.count } supporting organisations"
          ul do
            SupportingOrganisation.all.order(:name).map do |supporting_organisation|
              li do
                link_to(supporting_organisation.name, admin_supporting_organisation_path(supporting_organisation))
              end
            end
          end
          para link_to("Check relative logo sizes", supporting_organisations_path)
          para "There are #{ Signatory.count } signatories"
        end
      end

      column do
        panel "Content blocks defined" do
          table do
            ContentBlock.all.order(:key).map do |content_block|
              tr do
                td do
                  link_to(content_block.key, admin_content_block_path(content_block))
                end
                td do
                  content_block.content.truncate(80)
                end
              end
            end
          end
        end
      end
    end
  end
end
