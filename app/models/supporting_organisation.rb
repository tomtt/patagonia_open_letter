class SupportingOrganisation < ApplicationRecord
  acts_as_list

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "position", "url", "image_max_height", "updated_at"]
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
  validates :image_max_height, numericality: {in: 0..200}, allow_nil: true

  def admin_description
    name
  end

  def image_max_height_safe
    image_max_height || 200
  end
end
