class Signatory < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "organisation", "updated_at"]
  end
end
