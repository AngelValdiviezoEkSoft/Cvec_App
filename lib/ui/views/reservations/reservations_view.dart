import 'package:animate_do/animate_do.dart';
import 'package:cve_app/domain/domain.dart';
import 'package:cve_app/ui/ui.dart';
import 'package:flutter/material.dart';
//import 'package:cve_app/auth_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:provider/provider.dart';

String searchQueryRsv = '';
late TextEditingController searchRsvtTxt;

class ReservationsView extends StatefulWidget {
  
  const ReservationsView(Key? key) : super (key: key);
  
  @override
  ReservationsViewSt createState() => ReservationsViewSt();
}

class ReservationsViewSt extends State<ReservationsView> {

  @override
  void initState() {
    super.initState();
    searchRsvtTxt = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return BlocBuilder<GenericBloc, GenericState>(
      builder: (context,state) {
        return FutureBuilder(
          future: state.getReservation(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if(!snapshot.hasData) {
              return Scaffold(
                  backgroundColor: Colors.white,
                body: Center(
                  child: Image.asset(
                    "assets/gifs/gif_carga.gif",
                    height: size.width * 0.85,
                    width: size.width * 0.85,
                  ),
                ),
              );
            }
            else
            {  
              if(snapshot.data != null && snapshot.data!.isNotEmpty) {
                String rspTmp = snapshot.data as String;
                
                String objPerm = rspTmp;//.split('---')[2];

                List<ItemBoton> lstMenu = state.deserializeItemBotonMenuList(objPerm);

                List<ItemBoton> lstMenuFiltrado = lstMenu;

                if(searchQueryRsv.isNotEmpty){
                  lstMenuFiltrado = [];

                  lstMenuFiltrado = lstMenu
                    .where((tx) => tx.mensajeNotificacion.toLowerCase().contains(searchQueryRsv.toLowerCase()))
                    .toList();

                  //if(filteredTransactions.isNotEmpty){
                    groupedTransactions = {};

                    for (var tx in filteredTransactions) {
                      groupedTransactions.putIfAbsent(tx.mensaje2, () => []).add(tx);
                    }
                  //}
                  
                }
                else{
                  if(groupedTransactions.isEmpty){
                    for (var tx in lstMenu) {
                      groupedTransactions.putIfAbsent(tx.mensaje2, () => []).add(tx);
                    }
                  }                  
                }

                List<Widget> itemMap = lstMenuFiltrado.map(
                (item) => FadeInLeft(
                  duration: const Duration( milliseconds: 250 ),
                  child: 
                    ItemsListasWidget(
                      null,
                      varIdPosicionMostrar: 0,
                      varEsRelevante: item.esRelevante,
                      varIdNotificacion: item.ordenNot,
                      varNumIdenti: item.fechaNotificacion, //se usa para mostrar el campo de "room include"
                      icon: item.icon,
                      texto: item.mensajeNotificacion,
                      texto2: item.mensaje2,
                      color1: item.color1,
                      color2: item.color2,
                      onPress: () {  },
                      varMuestraNotificacionesTrAp: 0,
                      varMuestraNotificacionesTrProc: 0,
                      varMuestraNotificacionesTrComp: 0,
                      varMuestraNotificacionesTrInfo: 0,
                      varIconoNot: item.iconoNotificacion,
                      varIconoNotTrans: item.rutaImagen,
                      permiteGestion: permiteGestion,
                      rutaNavegacion: item.rutaNavegacion,
                    ),
                  )
                ).toList();

                return Container(
                width: size.width,
                height: size.height * 0.82,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: searchRsvtTxt,
                            decoration: InputDecoration(
                              hintText: 'Buscar',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {                                      
                                    searchQueryRsv = '';
                                    searchRsvtTxt.text = searchQueryRsv;
                                  });
                                },
                                icon: const Icon(Icons.close, color: Colors.black,),
                              )
                            ),
                            onEditingComplete: () {
                              FocusScope.of(context).unfocus();

                              setState(() {
                                searchQueryRsv = searchRsvtTxt.text;
                              });
                            },
                          ),
                        ),    
                        
                                  
                        Container(
                          width: size.width,
                          //height: size.height * 0.85,
                          height: size.height * 0.13 * lstMenu.length,
                          color: Colors.transparent,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: <Widget>[
                              const SizedBox( height: 3, ),
                              ...itemMap,
                              const SizedBox( height: 3, ),
                            ],
                          ),
                        ),
                                  
                        SizedBox(height: size.height * 0.07),
                        
                        /*
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 115.0),
                          child: ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text(
                              'Reporte',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        */
                      ],
                    ),
                  ),
                ),
              );
            
              }
              
            }

            return Container();
          }
        );
      }
    );
  
  }

}

/*
class ReservationsView extends StatelessWidget {

  const ReservationsView(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;        

    return Center(
      child: ChangeNotifierProvider(
        create: (_) => AuthService(),
        child: ReservationsViewSt(size: size),
      )        
    );
  }
}

class ReservationsViewSt extends StatelessWidget {
  const ReservationsViewSt({
    super.key,
    required this.size
  });

  final Size size;

  @override
  Widget build(BuildContext context) {

      return BlocBuilder<GenericBloc, GenericState>(
      builder: (context,state) {
        return FutureBuilder(
          future: state.getReservation(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if(!snapshot.hasData) {
              return Scaffold(
                  backgroundColor: Colors.white,
                body: Center(
                  child: Image.asset(
                    "assets/gifs/gif_carga.gif",
                    height: size.width * 0.85,
                    width: size.width * 0.85,
                  ),
                ),
              );
            }
            else
            {  
              if(snapshot.data != null && snapshot.data!.isNotEmpty) {
                String rspTmp = snapshot.data as String;
                
                String objPerm = rspTmp;//.split('---')[2];

                List<ItemBoton> lstMenu = state.deserializeItemBotonMenuList(objPerm);

                List<ItemBoton> lstMenuFiltrado = lstMenu;

                if(searchQueryRsv.isNotEmpty){
                  lstMenuFiltrado = [];

                  lstMenuFiltrado = lstMenu
                    .where((tx) => tx.mensajeNotificacion.toLowerCase().contains(searchQueryRsv.toLowerCase()))
                    .toList();

                  //if(filteredTransactions.isNotEmpty){
                    groupedTransactions = {};

                    for (var tx in filteredTransactions) {
                      groupedTransactions.putIfAbsent(tx.mensaje2, () => []).add(tx);
                    }
                  //}
                  
                }
                else{
                  if(groupedTransactions.isEmpty){
                    for (var tx in lstMenu) {
                      groupedTransactions.putIfAbsent(tx.mensaje2, () => []).add(tx);
                    }
                  }                  
                }

                List<Widget> itemMap = lstMenuFiltrado.map(
                (item) => FadeInLeft(
                  duration: const Duration( milliseconds: 250 ),
                  child: 
                    ItemsListasWidget(
                      null,
                      varIdPosicionMostrar: 0,
                      varEsRelevante: item.esRelevante,
                      varIdNotificacion: item.ordenNot,
                      varNumIdenti: item.fechaNotificacion, //se usa para mostrar el campo de "room include"
                      icon: item.icon,
                      texto: item.mensajeNotificacion,
                      texto2: item.mensaje2,
                      color1: item.color1,
                      color2: item.color2,
                      onPress: () {  },
                      varMuestraNotificacionesTrAp: 0,
                      varMuestraNotificacionesTrProc: 0,
                      varMuestraNotificacionesTrComp: 0,
                      varMuestraNotificacionesTrInfo: 0,
                      varIconoNot: item.iconoNotificacion,
                      varIconoNotTrans: item.rutaImagen,
                      permiteGestion: permiteGestion,
                      rutaNavegacion: item.rutaNavegacion,
                    ),
                  )
                ).toList();

                return Container(
                width: size.width,
                height: size.height * 0.82,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: searchRsvtTxt,
                            decoration: InputDecoration(
                              hintText: 'Buscar',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {                                      
                                    searchQueryRsv = '';
                                    searchRsvtTxt.text = searchQueryRsv;
                                  });
                                },
                                icon: const Icon(Icons.close, color: Colors.black,),
                              )
                            ),
                            onEditingComplete: () {
                              FocusScope.of(context).unfocus();

                              setState(() {
                                searchQueryRsv = searchRsvtTxt.text;
                              });
                            },
                          ),
                        ),    
                        
                                  
                        Container(
                          width: size.width,
                          //height: size.height * 0.85,
                          height: size.height * 0.13 * lstMenu.length,
                          color: Colors.transparent,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: <Widget>[
                              const SizedBox( height: 3, ),
                              ...itemMap,
                              const SizedBox( height: 3, ),
                            ],
                          ),
                        ),
                                  
                        SizedBox(height: size.height * 0.07),
                        
                        /*
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 115.0),
                          child: ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text(
                              'Reporte',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        */
                      ],
                    ),
                  ),
                ),
              );
            
              }
              
            }

            return Container();
          }
        );
      }
    );
  
  }

}
*/
