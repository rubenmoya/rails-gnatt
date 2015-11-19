class Assignment < ActiveRecord::Base

  validates :hours, numericality: { less_than_or_equal_to: 40 }
  validate :max_hours

  belongs_to :user
  belongs_to :task

  def max_hours
    user = User.find(user_id)
    user_hours = user.assignments.reduce(0) { |sum, h| sum + h.hours }

    if (hours + user_hours) > 40
      errors.add(:hours_per_user, "can't be more than 40")
    end
  end
end
