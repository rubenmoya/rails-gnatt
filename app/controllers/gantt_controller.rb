class GanttController < ApplicationController
  def index
    @users = User.all
  end
end
