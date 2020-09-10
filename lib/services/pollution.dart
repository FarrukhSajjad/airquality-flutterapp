class PollutionModel {
  String getPollution(int aqi) {
    if (aqi >= 0 && aqi <= 50) {
      return 'Good, Air quality is satisfactory, and air pollution poses little or no risk';
    } else if (aqi >= 51 && aqi <= 100) {
      return 'Moderate, Air Quality is Acceptable';
    } else if (aqi >= 101 && aqi <= 150) {
      return 'Unhealthy for Sensitive Group';
    } else if (aqi >= 151 && aqi <= 200) {
      return 'Unhealthy, Members of Sensitive group may experience severe effects';
    } else if (aqi >= 201 && aqi <= 300) {
      return 'Health alert: The risk of health effects is increased for everyone';
    } else {
      return 'Hazardous, Everyone is more likely to be Affected ';
    }
  }
}
