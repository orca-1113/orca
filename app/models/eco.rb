class Eco < ApplicationRecord
    belongs_to :user

    has_many :eco_tag_relations, dependent: :destroy
    has_many :tags, through: :eco_tag_relations, dependent: :destroy

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
end
