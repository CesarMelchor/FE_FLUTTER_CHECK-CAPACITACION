import 'package:check_capacitacion_front/src/providers/credenciales_provider.dart';
import 'package:check_capacitacion_front/src/providers/login_provider_c.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Styles {
  static double titutlo1 = 23;

  InputDecoration inputStyle1(label) {
    return InputDecoration(
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        floatingLabelStyle: const TextStyle(color: Colors.blue),
        label: Text(label));
  }

  BoxDecoration containerCred = BoxDecoration(
      color: Styles.crema2,
      borderRadius: const BorderRadius.all(Radius.circular(10)));

  InputDecoration inputLoginCred() {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Styles.rojo),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  static Color rojo = const Color.fromARGB(255, 157, 36, 73);

  static Color crema = const Color.fromARGB(255, 249, 245, 244);

  static Color crema2 = const Color.fromARGB(255, 193, 173, 164);

  InputDecoration inputStyleArtesano(label) {
    return InputDecoration(
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Styles.rojo),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        floatingLabelStyle:
            TextStyle(color: Styles.rojo, fontWeight: FontWeight.bold),
        label: Text(label, style: TextStyle(fontSize: Adaptive.sp(12)),));
  }

   InputDecoration inputStyleSearch(label, icon) {
    return InputDecoration(
      suffixIcon: icon,
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Styles.rojo),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        floatingLabelStyle:
            TextStyle(color: Styles.rojo, fontWeight: FontWeight.bold),
        label: Text(label));
  }

  InputDecoration inputListUser(label) {
    return InputDecoration(
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Styles.rojo),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        floatingLabelStyle:
            TextStyle(color: Styles.rojo, fontWeight: FontWeight.bold),
        label: Text(label));
  }


  InputDecoration inputBirthDate() {
    return InputDecoration(focusColor: Styles.rojo, fillColor: Styles.rojo);
  }

  Decoration dropAdArtesano = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      border: Border.all(color: Styles.rojo));

  BoxDecoration containerHome = const BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10)));

      
  BoxDecoration containerToolsCred =  BoxDecoration(
      color: Styles.rojo, borderRadius: const BorderRadius.all(Radius.circular(10)));

  BoxDecoration containerAdArtesano = BoxDecoration(
    border: Border.all(color: Colors.grey, width: 3),
    borderRadius: const BorderRadius.all(Radius.circular(12)),
  );

  BoxDecoration containerCredMargin = BoxDecoration(
    border: Border.all(color: Colors.grey, width: 3),
    borderRadius: const BorderRadius.all(Radius.circular(12)),
  );

  InputDecoration botonStylePassword(label, BuildContext context) {
    return InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            context.read<LoginProvider>().setLoginCredencial();
          },
          icon: Icon(context.watch<LoginProvider>().passC == false
              ? Icons.visibility
              : Icons.visibility_off),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        floatingLabelStyle: const TextStyle(color: Colors.blue),
        label: Text(label));
  }

  InputDecoration inputPasswordCred(BuildContext context) {
    return InputDecoration(
      suffixIcon: IconButton(
        onPressed: () {
          context.read<LoginProvider>().setLoginCredencial();
        },
        icon: Icon(
          context.watch<LoginProvider>().passC == false
              ? Icons.visibility
              : Icons.visibility_off,
          color: Styles.rojo,
        ),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Styles.rojo),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  static ButtonStyle buttonStyleCred = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 25),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  static ButtonStyle buttonAddArtesano = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding:  EdgeInsets.symmetric(horizontal: Adaptive.w(1)),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
    ),
  );

  static ButtonStyle buttonBothBorders = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding:  EdgeInsets.symmetric(horizontal: Adaptive.w(1)),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  
  static ButtonStyle buttonLogoutArtesano = ElevatedButton.styleFrom(
    foregroundColor: Styles.rojo,
    backgroundColor: Colors.white,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 25),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
    ),
  );

  
  static ButtonStyle buttonBordersRigth = ElevatedButton.styleFrom(
    foregroundColor: Styles.rojo,
    backgroundColor: Colors.white,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 25),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
    ),
  );

  static ButtonStyle buttonListArtesano = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 25),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
    ),
  );



   static ButtonStyle buttonViewEditArt = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor:  Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding:  EdgeInsets.symmetric(horizontal: Adaptive.w(1)),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );

  static ButtonStyle buttonListTecnicas = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor:  Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );


ButtonStyle buttonEditArtesano(BuildContext context) {
   return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: context.watch<CredencialProvider>().edit == false ? Colors.grey : Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
    ),
  );
   }

   ButtonStyle buttonEditOrganizacion(BuildContext context) {
   return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: context.watch<CredencialProvider>().editOrganizacion == false ? Colors.grey : Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
    ),
  );
   }

   
ButtonStyle buttonEditRama(BuildContext context) {
   return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: context.watch<CredencialProvider>().editRama == false ? Colors.grey : Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
    ),
  );
   }

   ButtonStyle buttonEditTecnica(BuildContext context) {
   return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: context.watch<CredencialProvider>().editTecnica == false ? Colors.grey : Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
    ),
  );
   }

   
ButtonStyle buttonEditTaller(BuildContext context) {
   return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: context.watch<CredencialProvider>().editTaller == false ? Colors.grey : Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
    ),
  );
   }

   
ButtonStyle buttonRenovados(BuildContext context) {
   return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: context.watch<CredencialProvider>().renovados == false ? Colors.grey : Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );
   }

   
ButtonStyle buttonSearchArtesanos(BuildContext context) {
   return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
   }

   
ButtonStyle buttonReporteArtesanos(BuildContext context) {
   return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Styles.rojo,
    minimumSize: Size(Adaptive.w(4.5), Adaptive.h(6)),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
   }
  
}
