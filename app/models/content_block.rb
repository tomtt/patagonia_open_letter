class ContentBlock < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "id_value", "key", "updated_at"]
  end

  def admin_description
    key
  end
end
