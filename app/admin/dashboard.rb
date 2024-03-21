# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Supporting Organisations" do
          para "There are #{ SupportingOrganisation.count } supporting organisations"
          table do
            SupportingOrganisation.all.order(:name).map do |supporting_organisation|
              tr do
                td do
                  link_to(supporting_organisation.name, admin_supporting_organisation_path(supporting_organisation))
                end
                td do
                  link_to(image_tag(supporting_organisation.logo.variant(:thumb), alt: "logo #{supporting_organisation.name}"), admin_supporting_organisation_path(supporting_organisation))
                end
              end
            end
          end
          para link_to("Check relative logo sizes", supporting_organisations_path)
        end
        panel "Signatories" do
          para "There are #{ Signatory.count } signatories"
        end

        panel "Letter Translations" do
          para "There are #{ LetterTranslation.count } letter translations"
          ul do
            LetterTranslation.all.order(:language_name).map do |letter_translation|
              li do
                link_to("#{letter_translation.language_name} - #{letter_translation.language_code}", admin_letter_translation_path(letter_translation))
              end
            end
          end
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
