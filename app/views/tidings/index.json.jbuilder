json.array!(@tidings) do |tiding|
  json.extract! tiding, :id, :title, :text, :image_id
  json.url tiding_url(tiding, format: :json)
end
