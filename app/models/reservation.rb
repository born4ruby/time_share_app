class Reservation < ActiveRecord::Base

  # Associations
  belongs_to :invitation, foreign_key: 'invitation_token'

end
