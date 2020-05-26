include Gravtastic
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  gravtastic :secure => true,
              :filetype => :gif,
              :size => 120
  has_many :mots, dependent: :destroy
end
