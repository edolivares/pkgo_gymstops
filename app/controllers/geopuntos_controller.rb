class GeopuntosController < ApplicationController

   def pokestops
      @pokeparadas=GeoElemento.all.where(tipo: 1)
   end
   def gyms
      @gyms=GeoElemento.all.where(tipo: 2)
   end
   def pkstops_gyms
      @geo_elementos=GeoElemento.all.order(tipo: :asc)
   end
end
