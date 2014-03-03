json.array!(@ex_sets) do |ex_set|
  json.extract! ex_set, :id, :sets, :reps, :weight
  json.url ex_set_url(ex_set, format: :json)
end
