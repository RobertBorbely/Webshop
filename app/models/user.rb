class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, dependent: :destroy 
  has_many :orders

  def role?(r)
    role.include? r.to_s
  end
end
