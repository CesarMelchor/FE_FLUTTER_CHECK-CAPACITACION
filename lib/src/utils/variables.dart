import 'package:intl/intl.dart';

class GlobalVariable {
  //local
  //static String baseUrlApi = "http://localhost:8080/";
  //online
  static String baseUrlApi = "https://sistema-ioa.com/backend/public/";
  static String idArtesanoEditCred = "";
  static String idOrganizacionEditCred = "";
  static String idRamaEditCred = "";
  static String idTecnicaEditCred = "";
  static String idMunicipioEditCred = "";

  static String idDistritoEditCred = "";
  static String idLocalidadEditCred = "";
  static String idRegionEditCred = "";
  static String idCred = "";

  static String currentDate =
      DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
  
  static String currentYear =
      DateFormat("yyyy").format(DateTime.now());
  
}
