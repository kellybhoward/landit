class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :state
  validates :company_name, :position, :city, :state, presence: true, length: { in: 2..255 }
end
