class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ecos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_ecos, through: :likes, source: :eco

  def already_liked?(eco)
    self.likes.exists?(eco_id: eco.id)
  end

end
