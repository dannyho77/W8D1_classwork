class Sub < ApplicationRecord
    validates :title, :description, presence:true


    has_one :moderator,
        foreign_key: :sub_id,
        class_name: :User

end
