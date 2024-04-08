class SupportingOrganisation < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "url", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["logo_attachment", "logo_blob"]
  end

  has_one_attached :logo do |attachable|
     attachable.variant :thumb, resize_to_limit: [100, 100], preprocessed: true
     attachable.variant :original, preprocessed: true
     attachable.variant :carousel, resize_to_limit: [350, 200], preprocessed: true
  end

  scope :has_logo, -> { joins(:logo_attachment) }
  validates :name, presence: true, uniqueness: true

  def admin_description
    name
  end
end
