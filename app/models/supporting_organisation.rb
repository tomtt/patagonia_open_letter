class SupportingOrganisation < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["logo_attachment", "logo_blob"]
  end

  has_one_attached :logo do |attachable|
     attachable.variant :thumb, resize_to_limit: [100, 100], preprocessed: true
     attachable.variant :small, resize_to_limit: [300, 200], preprocessed: true
     attachable.variant :displayed_logo, resize_to_limit: [300, 100], preprocessed: true
     attachable.variant :fixed_height, resize_to_limit: [nil, 200], preprocessed: true
  end
end
