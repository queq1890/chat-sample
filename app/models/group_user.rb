class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
  LOCATIONS = { shibuya: 1, umeda: 2, online: 13 }.freeze

  LOCATIONS.each do |name, l_id|
    method_name = (name.to_s + "?").to_sym
    define_method(method_name) do
      id == l_id
    end
  end
end
