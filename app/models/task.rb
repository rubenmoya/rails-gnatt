class Task < ActiveRecord::Base

  validates :name, presence: true
  validates :name, length: { maximum: 15 }

  belongs_to :project

  has_many :assignments
  has_many :users, through: :assignments

  accepts_nested_attributes_for :assignments, reject_if: :all_blank, allow_destroy: true
end
