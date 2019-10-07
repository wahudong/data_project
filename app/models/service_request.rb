class ServiceRequest < ApplicationRecord
  belongs_to :Electoral_ward
  belongs_to :Neighbourhood
end
