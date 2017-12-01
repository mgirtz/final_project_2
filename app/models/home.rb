class Home < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :user

  has_many   :documents,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
