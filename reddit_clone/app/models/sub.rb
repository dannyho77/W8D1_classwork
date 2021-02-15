class Sub < ApplicationRecord
    validates :title, :description, presence:true


    has_one :moderator,
        foreign_key: :sub_id,
        class_name: :User

    has_many :posts,
        foreign_key: :sub_id,
        class_name: :Post

    has_many :post_subs,
        foreign_key: :sub_id,
        class_name: :PostSub
    

end
