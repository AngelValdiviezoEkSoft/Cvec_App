import 'package:cve_app/auth_services.dart';
import 'package:cve_app/config/config.dart';
import 'package:cve_app/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PrincipalUserScreen extends StatelessWidget {

  const PrincipalUserScreen(Key? key) : super (key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Info App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PrincipalClientStScreen()
      ),
    );
  }
}


class PrincipalClientStScreen extends StatelessWidget {

  static const platform = MethodChannel('call_channel');

  static const platformEmail = MethodChannel('email_channel');

  final List<MenuOption> options = [
    MenuOption(icon: Icons.place, label: "Destinos", url: "https://centrodeviajesecuador.com/wp-content/uploads/2020/11/PLAN-GOLD1.jpg"),
    MenuOption(icon: Icons.home, label: "Membresías", url: 'https://centrodeviajesecuador.com/wp-content/uploads/2020/12/MENBRES%C3%8DA.jpg'),
    MenuOption(icon: Icons.web, label: "Compra tu terreno", url: 'https://centrodeviajesecuador.com/wp-content/uploads/2020/12/PLAN-TERRENO-2048x1536.jpg'),
    MenuOption(icon: Icons.info, label: "Tu casa programada", url: 'https://centrodeviajesecuador.com/wp-content/uploads/2020/11/Webp.net-resizeimage-2-1.jpg'),    
    MenuOption(icon: Icons.archive_rounded, label: "Revista", url: 'https://centrodeviajesecuador.com/wp-content/uploads/2024/01/image-2-980x551.png'),
  ];

  void makePhoneCall() async {
    
    if(Platform.isAndroid){
      try {
        await platform.invokeMethod('makePhoneCall', {'phone': "+593979856428"});
      } on PlatformException catch (_) {
        //print("Error al hacer la llamada: ${e.message}");
      }
    }
    
  }

  void openEmailApp(email) async {    
    try {
      await platformEmail.invokeMethod('openEmailApp', {'email': email});
    } on PlatformException catch (_) {
      //print("Error al abrir la app de correos: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final gnrBloc = Provider.of<GenericBloc>(context);

    return BlocBuilder<GenericBloc, GenericState>(
      builder: (context, state) {
        return Scaffold( 
          appBar: //!state.viewWebSite ?
          AppBar(
            backgroundColor: const Color(0xFF53C9EC),
          ),
          drawer: Drawer(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[                

                SizedBox(height: size.height * 0.075,),

                GestureDetector(
                  onTap: () {
                    context.push(objRutas.rutaPerfilScreen);
                  },
                  child: _buildProfileCard(context, size),
                ),
                
                ListTile(
                  leading: const Icon(Icons.document_scanner),
                  title: Text(locGen!.menuAccountStatementLbl),
                  onTap: () {
                    
                    gnrBloc.setShowViewAccountStatementEvent(true);
                    gnrBloc.setShowViewDebts(false);
                    gnrBloc.setShowViewPrintRecipts(false);
                    gnrBloc.setShowViewReservetions(false);
                    gnrBloc.setShowViewSendDeposits(false);
                    gnrBloc.setShowViewWebSite(false);
                    gnrBloc.setShowViewFrmDeposit(false);

                    Navigator.pop(context); // Cierra el menú 
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(locGen!.menuDebtsLbl),
                  onTap: () {
                    gnrBloc.setShowViewAccountStatementEvent(false);
                    gnrBloc.setShowViewDebts(true);
                    gnrBloc.setShowViewPrintRecipts(false);
                    gnrBloc.setShowViewReservetions(false);
                    gnrBloc.setShowViewSendDeposits(false);
                    gnrBloc.setShowViewWebSite(false);
                    gnrBloc.setShowViewFrmDeposit(false);
                    
                    Navigator.pop(context); // Cierra el menú 
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.send),
                  title: Text(locGen!.menuSendDepositsLbl),
                  onTap: () {
                    gnrBloc.setShowViewAccountStatementEvent(false);
                    gnrBloc.setShowViewDebts(false);
                    gnrBloc.setShowViewPrintRecipts(false);
                    gnrBloc.setShowViewReservetions(false);
                    gnrBloc.setShowViewSendDeposits(true);
                    gnrBloc.setShowViewWebSite(false);
                    gnrBloc.setShowViewFrmDeposit(false);
                    
                    Navigator.pop(context); // Cierra el menú 
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.print),
                  title: Text(locGen!.menuPrintReceiptsLbl),
                  onTap: () {
                    gnrBloc.setShowViewAccountStatementEvent(false);
                    gnrBloc.setShowViewDebts(false);
                    gnrBloc.setShowViewPrintRecipts(true);
                    gnrBloc.setShowViewReservetions(false);
                    gnrBloc.setShowViewSendDeposits(false);
                    gnrBloc.setShowViewWebSite(false);
                    gnrBloc.setShowViewFrmDeposit(false);

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.visibility),
                  title: Text(locGen!.menuSeeReservationsLbl),
                  onTap: () {
                    gnrBloc.setShowViewAccountStatementEvent(false);
                    gnrBloc.setShowViewDebts(false);
                    gnrBloc.setShowViewPrintRecipts(false);
                    gnrBloc.setShowViewReservetions(true);
                    gnrBloc.setShowViewSendDeposits(false);
                    gnrBloc.setShowViewWebSite(false);
                    gnrBloc.setShowViewFrmDeposit(false);

                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.web_rounded),
                  title: Text(locGen!.menuWebSiteLbl),
                  onTap: () {
                    gnrBloc.setShowViewAccountStatementEvent(false);
                    gnrBloc.setShowViewDebts(false);
                    gnrBloc.setShowViewPrintRecipts(false);
                    gnrBloc.setShowViewReservetions(false);
                    gnrBloc.setShowViewSendDeposits(false);
                    gnrBloc.setShowViewWebSite(true);
                    gnrBloc.setShowViewFrmDeposit(false);

                    Navigator.pop(context);
                  },
                ),
                
                SizedBox(height: size.height * 0.17,),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.web_rounded),
                  title: Text(locGen!.menuHelpSupportLbl),
                  onTap: () {
                    /*
                    gnrBloc.setShowViewAccountStatementEvent(false);
                    gnrBloc.setShowViewDebts(false);
                    gnrBloc.setShowViewPrintRecipts(false);
                    gnrBloc.setShowViewReservetions(false);
                    gnrBloc.setShowViewSendDeposits(false);
                    gnrBloc.setShowViewWebSite(true);
                    gnrBloc.setShowViewFrmDeposit(false);

                    Navigator.pop(context);
                    */
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: Text(locGen!.menuLogOutLbl),
                  onTap: () async {

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('¿Está seguro que desea cerrar su sesión?'),
                          
                          actions: [
                            TextButton(
                              onPressed: () async {

                                gnrBloc.setShowViewAccountStatementEvent(false);
                                gnrBloc.setShowViewDebts(false);
                                gnrBloc.setShowViewPrintRecipts(false);
                                gnrBloc.setShowViewReservetions(false);
                                gnrBloc.setShowViewSendDeposits(false);
                                gnrBloc.setShowViewWebSite(false);
                                gnrBloc.setShowViewFrmDeposit(false);
                                
                                Navigator.pop(context); // Cierra el menú 

                                await AuthService().logOut();

                                //ignore: use_build_context_synchronously
                                context.push(objRutas.rutaAuth);

                              },
                              child: Text('Sí', style: TextStyle(color: Colors.blue[200]),),
                            ),
                            TextButton(
                              onPressed: () {

                                Navigator.of(context).pop();

                                //context.push(objRutasGen.rutaBienvenida);

                              },
                              child: const Text('No', style: TextStyle(color: Colors.black),),
                            ),
                          ],
                        );
                      },
                    );

                  },
                ),
              ],
            ),
          ),
          body: 
          !state.viewAccountStatement && !state.viewPrintReceipts 
          && !state.viewSendDeposits && !state.viewViewDebts && 
          !state.viewViewReservations && !state.viewWebSite && !state.viewFrmDeposits ?
          
          SingleChildScrollView(
            child: Container(        
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://centrodeviajesecuador.com/wp-content/uploads/2020/11/PORTADA-PRINCIPAL-scaled.jpg'),
                  fit: BoxFit.fitHeight, // Ajusta la imagen al tamaño del contenedor
                  opacity: 0.3
                ),
              ),        
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.15,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [     
                        Positioned(
                          top: size.height * 0.03,
                          left: size.width * 0.235,
                          child: Container(
                            width: size.width * 0.35,
                            height: size.height * 0.09,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/logo_app_pequenio.png'),//Image(),//NetworkImage('https://centrodeviajesecuador.com/wp-content/uploads/2021/07/NARBONI-CORPORATION-PNG.png'), // URL de la imagen
                                fit: BoxFit.fitHeight, // Ajusta la imagen al tamaño del contenedor
                                opacity: 0.1
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * 0.85,
                          height: size.height * 0.12,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: size.height * 0.02,),
        
                              Container(
                                color: Colors.transparent,
                                width: size.width * 0.75,
                                height: size.height * 0.03,
                                child: const Text(
                                  "Centro de Viajes Ecuador",
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
            
                              SizedBox(
                                height: size.height * 0.02,
                              ),
        
                              Container(
                                color: Colors.transparent,
                                width: size.width * 0.97,
                                height: size.height * 0.035,
                                alignment: Alignment.center,
                                child: DefaultTextStyle(
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Canterbury',
                                  ),
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    pause: const Duration(microseconds: 1000),
        
                                    animatedTexts: [
                                      ScaleAnimatedText(locGen!.titulo1Introduccion, textStyle: const TextStyle(color: Colors.black)),
                                      ScaleAnimatedText(locGen!.titulo2Introduccion, textStyle: const TextStyle(color: Colors.black)),
                                    ],
                                    onTap: () {
                                    },
                                  ),
                                ),
                              )
                            ],
                          )
                          
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )

          :

          state.viewAccountStatement ?
          Container(
            width: size.width,
            height: size.height,
            color: Colors.transparent,
            child: Column(
              children: [

                Container(
                  width: size.width,
                  height: size.height * 0.06,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(locGen!.menuAccountStatementLbl, style: const TextStyle(fontSize: 25),)
                ),

                const AccountStatementView(null),
              ],
            ),
          )

          :

          state.viewViewDebts ?
          Container(
            width: size.width,
            height: size.height,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                children: [
              
                  Container(
                    width: size.width * 0.55,
                    height: size.height * 0.055,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(locGen!.menuDebtsLbl, style: const TextStyle(fontSize: 25),)
                  ),
              
                  const DebtView(null),
                ],
              ),
            ),
          )

          :

          state.viewSendDeposits ?
          Container(
            width: size.width,
            height: size.height,
            color: Colors.transparent,
            child: const DepositView(null),
            /*
            Column(
              children: [

                Container(
                  color: Colors.transparent,
                  width: size.width * 0.9,
                  height: size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.55,
                        height: size.height * 0.06,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(locGen!.menuSendDepositsLbl, style: const TextStyle(fontSize: 20),)
                      ),
                  
                      Container(
                        width: size.width * 0.35,
                        height: size.height * 0.06,
                        color: Colors.transparent,
                        child: GestureDetector(
                          onTap: () {
                            gnrBloc.setShowViewAccountStatementEvent(false);
                            gnrBloc.setShowViewDebts(false);
                            gnrBloc.setShowViewPrintRecipts(false);
                            gnrBloc.setShowViewReservetions(false);
                            gnrBloc.setShowViewSendDeposits(false);
                            gnrBloc.setShowViewWebSite(false);
                            gnrBloc.setShowViewFrmDeposit(true);
                          },
                          child: Container(
                            width: size.width * 0.04,
                            height: size.height * 0.03,
                            decoration: const BoxDecoration(
                              color: Colors.green, // Color de fondo
                              shape: BoxShape.circle, // Forma circular
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: const Icon(Icons.add, color: Colors.white), // Ícono dentro del botón
                          ),
                        ),
                  
                      ),
                             
                    ],
                  ),
                ),

                const DepositView(null),
                
              ],
            ),
            */
          )
          :

          state.viewFrmDeposits ?
          Container(
            width: size.width,
            height: size.height,
            color: Colors.transparent,
            child: const DepositFrmView(null),
          )

          :

          state.viewPrintReceipts ?
          Container(
            width: size.width,
            height: size.height,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                children: [
              
                  Container(
                    width: size.width,
                    height: size.height * 0.06,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(locGen!.receiptsLbl, style: const TextStyle(fontSize: 25),)
                  ),
              
                  const PrintReceiptView(null),
              
                ],
              ),
            ),
          )


          :

          state.viewViewReservations ?
          Container(
            width: size.width,
            height: size.height,
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.06,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(locGen!.reservationsLbl, style: const TextStyle(fontSize: 25),)
                  ),
              
                  const ReservationsView(null),
                ],
              ),
            ),
          )


          :

          state.viewWebSite ?
          Container(
            width: size.width,
            height: size.height,
            color: Colors.transparent,
            child: const Column(
              children: [

                WebSiteView(null),
              ],
            ),
          )


          :

          Container(color: Colors.red,)

        );
      }
    );
  }

  Widget _buildProfileCard(BuildContext context, Size size) {

    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),

          SizedBox(width: size.width * 0.02),//16),
          
          Container(
            color: Colors.transparent,
            width: size.width * 0.46,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: size.height * 0.002),
                Text(
                  'Duran City - Etapa Bromelia, MZ14-V13',
                  maxLines: 1, // Número de líneas que quieres mostrar (usualmente 1)
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: size.height * 0.002),
                Text(
                  'Propietario',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
          ),

          //SizedBox(width: 10),
          SizedBox(width: size.width * 0.0005),

          const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        ],
      ),
    );
  }
}
