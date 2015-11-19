class Task < ActiveRecord::Base
  belongs_to :project

  has_many :assignments
  has_many :users, through: :assignments

  accepts_nested_attributes_for :assignments, reject_if: :all_blank, allow_destroy: true
end
