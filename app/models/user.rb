class User < ApplicationRecord
    has_many :user_events
    has_many :events, through: :user_events
    has_many :created_events, foreign_key: :creator_id, class_name: "Event"

    has_and_belongs_to_many :friends,
                            class_name: "User",
                            join_table: :friendships,
                            foreign_key: :user_id,
                            association_foreign_key: :friend_user_id
end
