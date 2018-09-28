class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def today
    @tasks = Task.includes(:category).where(categories: {user_id: current_user.id}, date: Date.today)
    @events = Event.includes(:category).where(categories: {user_id: current_user.id}, date: Date.today)
    @notes = Note.includes(:category).where(categories: {user_id: current_user.id}, date: Date.today)
    @items = @tasks + @events + @notes
  end
end
