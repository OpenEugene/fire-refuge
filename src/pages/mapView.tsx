import { loadModules } from "esri-loader"
import React, { useEffect, useRef } from "react"

// define a type that is an array of the 4.x types you are using
// and indicate that loadModules() will resolve with that type
type MapModules = [
  typeof import("esri/WebMap"),
  typeof import("esri/views/MapView")
]
const WebMapView: React.FC = () => {
  const mapRef = useRef<HTMLDivElement>(null)
  useEffect(() => {
    // lazy load the required ArcGIS API for JavaScript modules and CSS
    const makeMap = async () => {
      if (mapRef.current) {
        const [ArcGISMap, MapView] = await (loadModules([
          "esri/WebMap",
          "esri/views/MapView",
        ]) as Promise<MapModules>)
        const map = new ArcGISMap({
          basemap: "topo-vector",
          portalItem: {
            id: "0274b41cbcde4525927aee322b005c69",
          },
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
            view.destroy()
          }
        }
      }
    }
    makeMap()
  })

  return (
    <div className="webmap" ref={mapRef} style={{ width: 500, height: 700 }} />
  )
}
export default WebMapView
