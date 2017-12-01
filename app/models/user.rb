class User < ApplicationRecord
  # Direct associations

  has_many   :homes,
             :dependent => :destroy

  # Indirect associations

  has_many   :documents,
             :through => :homes,
             :source => :documents

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
