class LetterTranslation < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "language_name", "language_code", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["pdf_attachment", "pdf_blob"]
  end

  def admin_description
    "#{language_name} (#{language_code})"
  end

  def pdf_preview
    return nil unless pdf.previewable?
    pdf&.preview({})
  end

  has_one_attached :pdf
  scope :has_pdf, -> { joins(:pdf_attachment) }
  validates :language_name, presence: true
  validates :language_code, presence: true
end
