class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pomodoros, dependent: :destroy
  has_many :tasks, dependent: :destroy
  
  validates :name, presence: true         
end
