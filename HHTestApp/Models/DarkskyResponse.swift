import Foundation

// MARK: - DarkskyResponse
struct DarkskyResponse: Codable {
  let latitude, longitude: Double?
  let timezone: String?
  let currently: Currently?
  let offset: Int?
  
  var text: String {
    return """
    timezone: \(timezone ?? "")
    cloudCover: \(currently?.cloudCover ?? 0)
    apparentTemperature: \(currently?.apparentTemperature ?? 0)
    pressure: \(currently?.pressure ?? 0)
    summary: \(currently?.summary ?? "")
    """
  }
}

// MARK: - Currently
struct Currently: Codable {
  let time: Int
  let summary, icon: String
  let nearestStormDistance: Int
  let precipIntensity, precipProbability: Double
  let precipType: String
  let temperature, apparentTemperature, dewPoint, humidity: Double
  let pressure, windSpeed, windGust: Double
  let windBearing: Int
  let cloudCover: Double
  let uvIndex: Int
  let visibility, ozone: Double
}
