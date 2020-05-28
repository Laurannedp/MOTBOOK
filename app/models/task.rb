class Task < ApplicationRecord
  has_many :triggers, dependent: :destroy
  belongs_to :mot
  validates :name, presence: true
end
