import 'package:cve_app/domain/domain.dart';
import 'package:cve_app/ui/bloc/bloc.dart';
import 'package:cve_app/ui/screens/reports/reports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:printing/printing.dart';

//ignore: must_be_immutable
class PdfView extends StatelessWidget {
  //ClienteType? invoice;
  String? tipoCertificado;
  String? periodo;
  String? periodoDesc;
  String? correoEnvio;
  bool? mostrarSueldo;
  final storageEcommerce = const FlutterSecureStorage();

  PdfView(Key? key,
    //ClienteType varInvoice,
    String varTipoCertificado,
    String? varPeriodo,
    String? varDescPeriodo,
    String? envioCorreo,
    bool varMostrarSueldo
  ) : super (key: key) {
    //invoice = varInvoice;
    tipoCertificado = varTipoCertificado;
    periodo = varPeriodo;
    periodoDesc = varDescPeriodo;
    correoEnvio = envioCorreo;
    mostrarSueldo = varMostrarSueldo;
  }

  AccountStatementModel rolDePago = AccountStatementModel();

  //method to make http request
  Future<dynamic> estadoCuentas() async {
    try {
      /*
      String tokenUser = await storageEcommerce.read(key: 'jwtEnrolApp') ?? '';
      var url = Uri.parse("https://apienrolapp.enrolapp.ec/api/v1/Reportes/GetCertifLaboralByIdentificacion/${invoice?.identificacion}");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenUser'
        },
      );
      
      final json = UsuarioTypeResponseRpt.fromJson(response.body);
      
      if (json.succeeded) {
        
        return json;
      } else {
        
      }
      */
    
      return rolDePago = AccountStatementModel(
        netoPagar: 20,
        totalEgresos: 100,
        totalIngresos: 50,
        listaIngresos: [
          ListaGreso(descripcion: 'Ingreso 1', cantidad: 20, tipoRubro: 'Rubro 1', valor: 20),
          ListaGreso(descripcion: 'Ingreso 2', cantidad: 21, tipoRubro: 'Rubro 2', valor: 21),
          ListaGreso(descripcion: 'Ingreso 3', cantidad: 22, tipoRubro: 'Rubro 3', valor: 22),
        ],
        listaEgresos: [
          ListaGreso(descripcion: 'Egreso 1', cantidad: 10, tipoRubro: 'Rubro 10', valor: 10),          
          ListaGreso(descripcion: 'Egreso 2', cantidad: 11, tipoRubro: 'Rubro 11', valor: 11),          
          ListaGreso(descripcion: 'Egreso 3', cantidad: 12, tipoRubro: 'Rubro 12', valor: 12),          
        ],
        cabeceraRol: CabeceraRol(
          apellidos: 'Valdiviezo G.',
          area: 'Test',
          cargo: 'Programador',
          cargoCorporativoRRHH: 'Cargo 2',
          centroCosto: 'CC',
          division: 'Div 1',
          empresa: 'Empresa',
          encargadoCoporativoRRHH: 'Test encargado',
          nombres: 'Angel Elías',
          observacion: 'Test Obs.',
          periodo: 'Periodo 1',
          proceso: 'Proceso 1',
          sueldo: 200,
          tipoPago: 'Efectivo',
          tipoNomina: 'Nómina de prueba',
          sucursal: 'Sucursal 1',
          subCentroCosto: 'Centro de costo 1'
        )
      );

    } on Exception catch (_) {
    
    }
  }

  //method to make http request
  Future<dynamic> printReceipt() async {
    try {
      /*
      String tokenUser = await storageEcommerce.read(key: 'jwtEnrolApp') ?? '';
      var url = Uri.parse("https://apienrolapp.enrolapp.ec/api/v1/Reportes/GetCertifLaboralByIdentificacion/${invoice?.identificacion}");
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenUser'
        },
      );
      
      final json = UsuarioTypeResponseRpt.fromJson(response.body);
      
      if (json.succeeded) {
        
        return json;
      } else {
        
      }
      */
    
      return rolDePago = AccountStatementModel(
        netoPagar: 20,
        totalEgresos: 100,
        totalIngresos: 50,
        listaIngresos: [
          ListaGreso(descripcion: 'Ingreso 1', cantidad: 20, tipoRubro: 'Rubro 1', valor: 20),
          ListaGreso(descripcion: 'Ingreso 2', cantidad: 21, tipoRubro: 'Rubro 2', valor: 21),
          ListaGreso(descripcion: 'Ingreso 3', cantidad: 22, tipoRubro: 'Rubro 3', valor: 22),
        ],
        listaEgresos: [
          ListaGreso(descripcion: 'Egreso 1', cantidad: 10, tipoRubro: 'Rubro 10', valor: 10),          
          ListaGreso(descripcion: 'Egreso 2', cantidad: 11, tipoRubro: 'Rubro 11', valor: 11),          
          ListaGreso(descripcion: 'Egreso 3', cantidad: 12, tipoRubro: 'Rubro 12', valor: 12),          
        ],
        cabeceraRol: CabeceraRol(
          apellidos: 'Valdiviezo G.',
          area: 'Test',
          cargo: 'Programador',
          cargoCorporativoRRHH: 'Cargo 2',
          centroCosto: 'CC',
          division: 'Div 1',
          empresa: 'Empresa',
          encargadoCoporativoRRHH: 'Test encargado',
          nombres: 'Angel Elías',
          observacion: 'Test Obs.',
          periodo: 'Periodo 1',
          proceso: 'Proceso 1',
          sueldo: 200,
          tipoPago: 'Efectivo',
          tipoNomina: 'Nómina de prueba',
          sucursal: 'Sucursal 1',
          subCentroCosto: 'Centro de costo 1'
        )
      );

    } on Exception catch (_) {
    
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<GenericBloc, GenericState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(tipoCertificado ?? '', style: const TextStyle(color: Colors.black),),
          ),
          body: state.viewAccountStatement ?
          FutureBuilder(
            future: estadoCuentas(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error} occurred',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return PdfPreview(
                    pdfFileName: "EstadoCuenta.pdf",
                    canChangePageFormat: false,
                    canDebug: false,
                    canChangeOrientation: false,
                    build: (context) => accountStatementRpt(rolDePago, correoEnvio!, periodoDesc!, periodo!),
                  );
                }
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
          :
          state.viewPrintReceipts ?
          FutureBuilder(
            future: printReceipt(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error} occurred',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return PdfPreview(
                    pdfFileName: "Recibo.pdf",
                    canChangePageFormat: false,
                    canDebug: false,
                    canChangeOrientation: false,
                    build: (context) => printReceiptRpt(),
                  );
                }
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
          :
          FutureBuilder(
            future: generateReservation(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error} occurred',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return PdfPreview(
                    pdfFileName: "Reservas.pdf",
                    canChangePageFormat: false,
                    canDebug: false,
                    canChangeOrientation: false,
                    build: (context) => generateReservation(),
                  );
                }
              }
              return const Center(child: CircularProgressIndicator());
            },
          )
        );
      }
    );

  }
}
