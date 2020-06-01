class Mot < ApplicationRecord
  has_many :tasks, -> { order('delay ASC') }, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
end



