class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :items_today, only: [:index, :today]
  before_action :load_backlog, only: [:index, :today]

  def index
    @unmarked = Task.includes(:category).where(categories: {user_id: current_user.id}, tasks: {mark: 0}).where("date < ?", Date.today)
  end

  def today
  end

  private

  def items_today
    @tasks = Task.includes(:category).where(categories: {user_id: current_user.id}, date: Date.today)
    @events = Event.includes(:category).where(categories: {user_id: current_user.id}, date: Date.today)
    @notes = Note.includes(:category).where(categories: {user_id: current_user.id}, date: Date.today)
    @items = @tasks + @events + @notes
  end

  def load_backlog
    @backlog = Task.includes(:category).where(categories: {user_id: current_user.id}, date: nil)
  end
end
