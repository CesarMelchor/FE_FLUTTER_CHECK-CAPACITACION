import 'package:check_capacitacion_front/src/utils/messages.dart';
import 'package:check_capacitacion_front/src/utils/styles.dart';
import 'package:check_capacitacion_front/src/utils/variables.dart';
import 'package:custom_dropdown_2/custom_dropdown2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:material_loading_buttons/material_loading_buttons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cooky/cooky.dart' as cookie;
import 'package:vrouter/vrouter.dart';

class CheckAsistScreen extends StatefulWidget {
  const CheckAsistScreen({super.key});

  @override
  State<CheckAsistScreen> createState() => _CheckAsistScreenState();
}

class _CheckAsistScreenState extends State<CheckAsistScreen> {
  TextEditingController accion = TextEditingController();

  Response inscripciones = Response(requestOptions: RequestOptions());
  Response inscripcionesCganges = Response(requestOptions: RequestOptions());
  Response acciones = Response(requestOptions: RequestOptions());
  Response updateAsistencia = Response(requestOptions: RequestOptions());
  Dio dio = Dio();

  Future apiGetAcciones() async {
    acciones = await dio.get('${GlobalVariable.baseUrlApi}scav/v1/acciones');

    return acciones.data;
  }

  Future apiGetInscripciones() async {
    inscripciones =
        await dio.get('${GlobalVariable.baseUrlApi}scav/v1/inscripciones');
    inscripcionesView = inscripciones.data;
    return inscripciones.data;
  }

  Future apiGetInscripcionesAfterChanges() async {
    inscripcionesCganges =
        await dio.get('${GlobalVariable.baseUrlApi}scav/v1/inscripciones');
    setState(() {
      inscripcionesView = inscripcionesCganges.data;
    });
    return inscripcionesCganges.data;
  }

  String idAccion = "";

  List inscripcionesView = [];
  bool enviando = false;

  void idAccionSelected(String nombreAccion) {
    for (var i = 0; i < acciones.data.length; i++) {
      if (acciones.data[i]['nombre'] == nombreAccion) {
        setState(() {
          idAccion = acciones.data[i]['id'];
        });
      }
    }

    inscripcionesView =
        inscripciones.data.where((i) => i['id_accion'] == idAccion).toList();
  }

  bool isChecked = true;
  String idArtesano = "";
  List asistenciasUpdate = [];
  List asistenciasUpdateRemove = [];

  void addAsistencia($id) async {
    var asistencias = {'id': $id};
    asistenciasUpdate.add(asistencias);
  }

  void addAsistenciaRemove($id) async {
    var asistencias = {'id': $id};
    asistenciasUpdateRemove.add(asistencias);
  }

  Future<bool> apiUpdateAsistencia() async {

    setState(() {
      enviando = true;
    });

    updateAsistencia = await dio.put(
        '${GlobalVariable.baseUrlApi}scav/v1/inscripciones/update/asistencias',
        data: {'alta': asistenciasUpdate, 'baja': asistenciasUpdateRemove});
    setState(() {
      enviando = false;
    });
    if (updateAsistencia.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  late final Future getAcciones = apiGetAcciones();
  late final Future getInscripciones = apiGetInscripciones();

  @override
  Widget build(BuildContext context) {
    var value = cookie.get('id');
    if (value != "") {
    }else{
       context.vRouter.to("/home");
    }

    return FutureBuilder(
        future: getInscripciones,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData
              ? Scaffold(
                  body: ListView(
                    children: [
                      Container(
                        width: Adaptive.w(100),
                        height: Adaptive.h(20),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/ORGANIZACION_INFORMACION-03.png"))),
                        child: SizedBox(
                          width: Adaptive.w(100),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/ORGANIZACION_INFORMACION-09.png",
                                width: Adaptive.w(60),
                              ),
                      Expanded(child: Container()),
                      ElevatedButton.icon(
                          icon: const Icon(Icons.logout),
                          style: Styles.buttonLogoutArtesano,
                          onPressed: () {
                            cookie.remove('id');
                            context.vRouter.to("/home");
                          },
                          label: Text(
                            "SALIR",
                            style: TextStyle(fontSize: Adaptive.sp(11)),
                          )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Adaptive.h(2),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Adaptive.w(3),
                          ),
                          SizedBox(
                            width: Adaptive.w(60),
                            height: Adaptive.h(5),
                            child: FutureBuilder(
                              future: getAcciones,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                return snapshot.hasData
                                    ? CustomDropDownII.search(
                                        hintStyle: TextStyle(
                                          fontSize: Adaptive.sp(14),
                                        ),
                                        listItemStyle: TextStyle(
                                          fontSize: Adaptive.sp(14),
                                        ),
                                        controller: accion,
                                        hintText: 'Accion',
                                        selectedStyle: TextStyle(
                                            color: Styles.rojo,
                                            fontSize: Adaptive.sp(12)),
                                        errorText: 'Sin resultados',
                                        onChanged: (p0) {
                                          idAccionSelected(p0);
                                        },
                                        borderSide:
                                            BorderSide(color: Styles.rojo),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        items: [
                                          for (var item in acciones.data)
                                            item['nombre']
                                        ],
                                      )
                                    : Padding(
                                        padding:
                                            EdgeInsets.all(Adaptive.w(1.15)),
                                        child: LinearProgressIndicator(
                                          color: Styles.rojo,
                                        ),
                                      );
                              },
                            ),
                          ),
                          SizedBox(
                            width: Adaptive.w(2),
                          ),
                          OutlinedLoadingButton(
                              isLoading: enviando,
                              style: Styles().buttonSearchArtesanos(context),
                              loadingIcon: const Icon(Icons.send),
                              loadingLabel: const Text('Enviando...'),
                              onPressed: () async {
                                if (await apiUpdateAsistencia()) {
                                  // ignore: use_build_context_synchronously
                                  Message().mensaje(Colors.green, Icons.done,
                                      'Registros actualizados', context);
                                }else{
                                  // ignore: use_build_context_synchronously
                                  Message().mensaje(Colors.red, Icons.error,
                                      'Error, intenta de nuevo', context);
                                }
                              },
                              child: const Text('Enviar'))
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(4),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
                        child: Row(
                          children: [
                            SizedBox(
                                width: Adaptive.w(30),
                                child: Text(
                                  "NOMBRE",
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(13),
                                      fontWeight: FontWeight.w600),
                                )),
                            SizedBox(
                              width: Adaptive.w(1),
                            ),
                            SizedBox(
                                width: Adaptive.w(30),
                                child: Text(
                                  "ACCION",
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(13),
                                      fontWeight: FontWeight.w600),
                                )),
                            SizedBox(
                              width: Adaptive.w(1),
                            ),
                            SizedBox(
                                width: Adaptive.w(10),
                                child: Text(
                                  "TRIMESTRE",
                                  style: TextStyle(
                                      fontSize: Adaptive.sp(13),
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Adaptive.h(1),
                      ),
                      Column(
                        children: [
                          for (var item in inscripcionesView)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Adaptive.w(1)),
                              child: ExpansionTile(
                                trailing: SizedBox(
                                  width: Adaptive.w(7),
                                  child: item['asistencia'] == '1'
                                      ? CheckboxListTile(
                                          activeColor: Styles.rojo,
                                          value: true,
                                          onChanged: (bool? value) {
                                            for (var i = 0;
                                                i < inscripcionesView.length;
                                                i++) {
                                              if (inscripcionesView[i]['id'] ==
                                                  item['id']) {
                                                setState(() {
                                                  inscripcionesView[i]
                                                      ['asistencia'] = '0';
                                                  addAsistenciaRemove(
                                                      item['id']);
                                                });
                                              }
                                            }
                                          },
                                        )
                                      : CheckboxListTile(
                                          activeColor: Styles.rojo,
                                          value: false,
                                          onChanged: (bool? value) {
                                            for (var i = 0;
                                                i < inscripcionesView.length;
                                                i++) {
                                              if (inscripcionesView[i]['id'] ==
                                                  item['id']) {
                                                setState(() {
                                                  inscripcionesView[i]
                                                      ['asistencia'] = '1';
                                                  addAsistencia(item['id']);
                                                });
                                              }
                                            }
                                          },
                                        ),
                                ),
                                title: Row(
                                  children: [
                                    SizedBox(
                                        width: Adaptive.w(30),
                                        child: Text(
                                          item['nombre'] +
                                                  ' ' +
                                                  item['primer_apellido'] +
                                                  ' ' +
                                                  item['segundo_apellido'] ??
                                              '',
                                          style: TextStyle(
                                              fontSize: Adaptive.sp(13),
                                              fontWeight: FontWeight.w600),
                                        )),
                                    SizedBox(
                                      width: Adaptive.w(1),
                                    ),
                                    SizedBox(
                                        width: Adaptive.w(30),
                                        child: Text(
                                          item['nombreaccion'] ?? '',
                                          style: TextStyle(
                                              fontSize: Adaptive.sp(13),
                                              fontWeight: FontWeight.w600),
                                        )),
                                    SizedBox(
                                      width: Adaptive.w(1),
                                    ),
                                    SizedBox(
                                        width: Adaptive.w(10),
                                        child: Text(
                                          item['trimestreid'] ?? '',
                                          style: TextStyle(
                                              fontSize: Adaptive.sp(13),
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ],
                                ),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                )
              : Image.asset("assets/images/cargando.gif");
        });
  }
}
