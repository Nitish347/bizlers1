class Vehical {
  String? VehicalNumber;
  String? Make;
  String? Model;
  String? FuelType;
  String? Transmission;

  Vehical(
      {this.FuelType,
      this.Make,
      this.Model,
      this.Transmission,
      this.VehicalNumber});

  Map<String, dynamic> toJson() {
    return {
      "VehicalNumber": VehicalNumber,
      "Make": Make,
      "Model": Model,
      "FuelType": FuelType,
      "Transmission": Transmission
    };
  }
}
