class LetterTranslation < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "language_name", "language_code", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["pdf_attachment", "pdf_blob"]
  end

  def description
    "Letter Translation #{language_name} (#{language_code})"
  end

  def pdf_preview
    return nil unless pdf.previewable?
    pdf&.preview({})
  end

  has_one_attached :pdf
end
