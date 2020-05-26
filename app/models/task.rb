class Task < ApplicationRecord
  has_many :actions, dependent: :destroy
  belongs_to :mot
  validates :name, presence: true
end
