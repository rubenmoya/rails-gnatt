class Task < ActiveRecord::Base
  belongs_to :project

  has_many :assignments
  has_many :users, through: :assignments

  accepts_nested_attributes_for :assignments, :allow_destroy => true
end
