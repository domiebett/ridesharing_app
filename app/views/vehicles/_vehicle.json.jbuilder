json.extract! vehicle, :id, :vehicle_model, :license_plate, :capacity, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
