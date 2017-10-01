class Category < ApplicationRecord
  has_many :ceramiques
  belongs_to :user

  validates :name, presence: true, uniqueness: true
end
