json.type "FeatureCollection"
json.features @geo_elementos do |elementos|
      json.type "Feature"
      json.properties do
         json.titulo elementos.name
         json.popupContent elementos.name
         json.tipo elementos.tipo
         if elementos.tipo == 1
            json.icon "pokestop"
         else
            json.icon "gym"
         end
      end
      json.geometry do
         json.type "Point"
         json.coordinates [elementos.longitude, elementos.latitude]
      end 
end