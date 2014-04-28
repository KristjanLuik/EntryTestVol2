json.array!(@timetables) do |timetable|
  json.extract! timetable, :id, :registration_start, :registration_end, :start, :end, :slots, :location, :test_id
  json.url timetable_url(timetable, format: :json)
end
