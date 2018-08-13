json.extract! ride, :id, :origin, :destination, :departure_date, :departure_time, :description, :vehicle_id, :created_at, :updated_at
json.url ride_url(ride, format: :json)
