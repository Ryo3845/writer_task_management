class Project < ApplicationRecord
  validates :title, presence: true
  belongs_to :client
  belongs_to :user
end
