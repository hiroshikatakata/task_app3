json.extract! schedule, :id, :name, :start, :end, :check, :introduction, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
