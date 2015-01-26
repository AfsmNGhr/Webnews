json.array!(@tidings) do |tiding|
  json.extract! tiding, :id, :title, :text, :image
  json.url tiding_url(tiding)
  json.category_ids tiding.categories.pluck(:id)
  json.tag_ids tiding.tags.pluck(:id)
end
