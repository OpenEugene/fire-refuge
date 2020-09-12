import { loadModules } from "esri-loader"
import React, { useEffect, useRef } from "react"

const WebMapView: React.FC = () => {
  const mapRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    // lazy load the required ArcGIS API for JavaScript modules and CSS
    if (mapRef.current) {
      loadModules(["esri/Map", "esri/views/MapView"], {
        css: true,
      }).then(([ArcGISMap, MapView]) => {
        const map = new ArcGISMap({
          basemap: "topo-vector",
        })

        // load the map view at the ref's DOM node
        const view = new MapView({
          container: mapRef.current,
          map: map,
          center: [-118, 34],
          zoom: 8,
        })

        return () => {
          if (view) {
            // destroy the map view
            view.container = null
          }
        }
      })
    }
  }, [mapRef])

  return (
    <div style={{ width: 300, height: 400 }}>
      <div className="webmap" ref={mapRef} />
    </div>
  )
}
export default WebMapView
