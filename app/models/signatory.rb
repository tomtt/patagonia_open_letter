class Signatory < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "position", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["logo_attachment", "logo_blob"]
  end

  has_one_attached :logo do |attachable|
     attachable.variant :thumb, resize_to_limit: [100, 100], preprocessed: true
     attachable.variant :original, preprocessed: true
     attachable.variant :signatory_list, resize_to_limit: [150, 150], preprocessed: true
  end

  validates :name, presence: true, uniqueness: true
end
