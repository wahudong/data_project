# frozen_string_literal: true

class ElectoralWard < ApplicationRecord
  validates :name, :mla_name, presence: true
  has_many :service_requests
end
