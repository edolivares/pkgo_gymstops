json.extract! geo_elemento, :id, :name, :latitude, :longitude, :tipo, :votes, :created_at, :updated_at
json.url geo_elemento_url(geo_elemento, format: :json)