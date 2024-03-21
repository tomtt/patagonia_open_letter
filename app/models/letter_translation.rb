class LetterTranslation < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "language_name", "language_code", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["pdf_attachment", "pdf_blob"]
  end

  has_one_attached :pdf
end
