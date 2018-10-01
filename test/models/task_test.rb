require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "recheduling task deletes date" do
    @task = tasks(:one)
    assert @task.date != nil
    @task.mark = "rescheduled"
    @task.save
    assert @task.date == nil
  end
end
