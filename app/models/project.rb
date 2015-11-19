class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { maximum: 15 }
  has_many :tasks
end
