class Home < ApplicationRecord
  # Direct associations

  has_many   :documents,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
