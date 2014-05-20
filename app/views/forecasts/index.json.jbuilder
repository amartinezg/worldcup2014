json.array!(@forecasts) do |forecast|
  json.extract! forecast, :id, :group, :forecast1, :forecast2, :user_id
  json.url forecast_url(forecast, format: :json)
end
