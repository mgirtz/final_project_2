class Document < ApplicationRecord
  # Direct associations

  belongs_to :home

  # Indirect associations

  has_one    :user,
             :through => :home,
             :source => :user

  # Validations

end
