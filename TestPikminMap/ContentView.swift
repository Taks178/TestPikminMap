//
//  ContentView.swift
//  TestPikminMap
//
//  Created by Takeshi Nishida on 2025/04/06.
//
import SwiftUI
import MapLibre
import MapLibreSwiftDSL
import MapLibreSwiftUI
import CoreLocation

struct PolylineMapView: View {
    // You'll need a MapLibre Style for this to work.
    // You can use https://demotiles.maplibre.org/style.json for basic testing.
    // For a list of commercially supported tile providers, check out https://wiki.openstreetmap.org/wiki/Vector_tiles#Providers.
    // These providers all have their own "house styles" as well as custom styling.
    // You can create your own style or modify others (subject to license restrictions) using https://maplibre.org/maputnik/.
    let styleURL = URL(string: "https://tile.openstreetmap.jp/styles/osm-bright-ja/style.json")!
    
    // Just a list of waypoints (ex: a route to follow)
    let waypoints: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: 35.713586, longitude: 139.777218),
        CLLocationCoordinate2D(latitude: 35.713451, longitude: 139.777545),
        CLLocationCoordinate2D(latitude: 35.713334, longitude: 139.777803),
        CLLocationCoordinate2D(latitude: 35.713107, longitude: 139.777658),
        CLLocationCoordinate2D(latitude: 35.712846, longitude: 139.777449)
      ]

    var body: some View {
        MapView(styleURL: styleURL,
                camera: .constant(.center(waypoints.first!, zoom: 14)))
        {
            // Define a data source.
            // It will be automatically if a layer references it.
            let polylineSource = ShapeSource(identifier: "polyline") {
                MLNPolylineFeature(coordinates: waypoints)
            }
            
            // Add a polyline casing for a stroke effect
            LineStyleLayer(identifier: "polyline-casing", source: polylineSource)
                .lineCap(.round)
                .lineJoin(.round)
                .lineColor(.white)
                .lineWidth(interpolatedBy: .zoomLevel,
                           curveType: .exponential,
                           parameters: NSExpression(forConstantValue: 1.5),
                           stops: NSExpression(forConstantValue: [14: 6, 18: 24]))

            // Add an inner (blue) polyline
            LineStyleLayer(identifier: "polyline-inner", source: polylineSource)
                .lineCap(.round)
                .lineJoin(.round)
                .lineColor(.systemBlue)
                .lineWidth(interpolatedBy: .zoomLevel,
                           curveType: .exponential,
                           parameters: NSExpression(forConstantValue: 1.5),
                           stops: NSExpression(forConstantValue: [14: 3, 18: 16]))
        }
    }
}

