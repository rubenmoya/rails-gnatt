class User < ActiveRecord::Base
  has_many :assignments
  has_many :tasks, through: :assignments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.not_in_task task, uid
    where("id not in (?)", task.assignments.collect{|e| e.user_id }.select{|i| i != uid})
  end
end
