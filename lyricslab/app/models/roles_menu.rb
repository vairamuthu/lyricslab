class RolesMenu < ActiveRecord::Base
belongs_to :menu
belongs_to :role

 validates :menu_id, uniqueness: { scope: :role_id,
    message: "Duplicate Menu " }
end
