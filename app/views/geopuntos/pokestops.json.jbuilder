json.type "FeatureCollection"
json.features @pokeparadas do | pokeparada|
      json.type "Feature"
      json.properties do
         json.titulo pokeparada.name
         json.popupContent pokeparada.name
      end
      json.geometry do
         json.type "Point"
         json.coordinates [pokeparada.longitude, pokeparada.latitude]
      end 
end