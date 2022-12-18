import 'package:flutter/cupertino.dart';

import '../models/vehicalModel.dart';

class VehicalProvider with ChangeNotifier {
  List<dynamic> VehicalName = [];
  bool isLoading = true;

  void updateVehicalNameList(List<dynamic> VehicalName) {
    this.VehicalName = VehicalName;
    print(VehicalName.toString());
    isLoading = false;
    notifyListeners();
  }

  List<dynamic> ModelName = [];
  bool modelNameLoading = true;

  void updateVehicalModelList(List<dynamic> ModelName) {
    this.ModelName = ModelName;
    print(ModelName.toString());
    modelNameLoading = false;
    notifyListeners();
  }

  Vehical vehical = new Vehical();
  String FuelType = "";
  String Make = "";
  String Model = "";
  String Transmission = "";
  String VehicalNumber = "";
  void updateVehical(
      {String? FuelType,
      String? Make,
      String? Model,
      String? Transmission,
      String? VehicalNumber}) {
    this.VehicalNumber =
        VehicalNumber == null ? this.VehicalNumber : VehicalNumber;
    this.Transmission = Transmission == null ? this.Transmission : Transmission;
    this.FuelType = FuelType == null ? this.FuelType : FuelType;
    this.Make = Make == null ? this.Make : Make;
    this.Model = Model == null ? this.Model : Model;
    notifyListeners();
  }

  void updateVehicalModel() {
    vehical.Transmission = Transmission;
    vehical.FuelType = FuelType;
    vehical.Make = Make;
    vehical.Model = Model;
    vehical.VehicalNumber = VehicalNumber;
    notifyListeners();
  }
}
