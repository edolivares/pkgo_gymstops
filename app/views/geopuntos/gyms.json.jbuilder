json.type "FeatureCollection"
json.features @gyms do | gym|
      json.type "Feature"
      json.properties do
         json.titulo gym.name
         json.popupContent gym.name
      end
      json.geometry do
         json.type "Point"
         json.coordinates [gym.longitude, gym.latitude]
      end 
end