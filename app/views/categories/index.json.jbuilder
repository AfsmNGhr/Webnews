json.array!(@categories) do |category|
  json.extract! category, :id, :title, :text
  json.tiding_ids category.tidings.pluck(:id)
end
