json.array!(@scores) do |score|
  json.extract! score, :id, :points, :reason, :user_id, :forecast_id
  json.url score_url(score, format: :json)
end
