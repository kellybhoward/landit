class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :state
  validates :company_name, presence: true, length: { in: 2..255 }
  validates :application_url, presence: true

  
end
