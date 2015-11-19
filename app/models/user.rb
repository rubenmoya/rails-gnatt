class User < ActiveRecord::Base
  has_many :assignments
  has_many :tasks, through: :assignments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.user_collection task, uid
    assignments = task.assignments.collect{|e| e.user_id }


    if uid.nil?
      if assignments.empty?
        all
      else
        where("id not in (?)", assignments)
      end
    else
      where("id not in (?)", assignments).concat([find(uid)])
    end
  end
end
