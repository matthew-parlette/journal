json.extract! task, :id, :name, :date, :mark, :recurrence, :category_id, :created_at, :updated_at
json.url task_url(task, format: :json)
