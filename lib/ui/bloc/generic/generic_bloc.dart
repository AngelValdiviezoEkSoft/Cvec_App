import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cve_app/config/config.dart';
import 'package:cve_app/domain/domain.dart';
import 'package:cve_app/infraestructure/infraestructure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'generic_event.dart';
part 'generic_state.dart';

class GenericBloc extends Bloc<GenericEvent, GenericState> { 
  int positionMenu = 0;
  int positionFormaPago = 0;
  double coordenadasMapa = 0;
  double radioMarcacion = 0;
  String formaPago = '';
  String localidadId = '';
  String idFormaPago = '';
  double heightModalPlanAct = 0.65;

  bool viewAccountStatement = false;
  bool viewViewDebts = false;
  bool viewSendDeposits = false;
  bool viewPrintReceipts = false;
  bool viewViewReservations = false;
  bool viewWebSite = false;
  bool viewFrmDeposits = false;
  bool cargando = false;
  bool levantaModal = false;

  GenericBloc() : super(const GenericState(
    positionMenu: 0, positionFormaPago: 0, coordenadasMapa: 0.0, 
    radioMarcacion: 0.0,formaPago: '',localidadId: '', idFormaPago: '', 
    heightModalPlanAct: 0.65)) {
    on<OnNewCambioHeightModalPlanActEvent>(_onReInitHeight);
    on<OnNewPositionEvent>(_onReInitPosition);
    on<OnNewCoordenadasPositionEvent>(_onReInitPositionMapa);
    on<OnNewFormaPagoEvent>(_onCambioFormaPago);
    on<OnNewRadioMarcacionEvent>(_onCambioRadio);
    on<OnNewLocalidadMarcacionEvent>(_onCambioLocalidad);
    on<OnNewIdFormaPagoEvent>(_onCambioIdFormaPago);
    on<OnNewPositionFormaPagoEvent>(_onInitPositionFormaPago);
    on<OnShowViewAccountStatementEvent>(_onInitViewAccountStatement);
    on<OnShowViewDebtsEvent>(_onInitViewViewDebts);
    on<OnShowViewSendDepositsEvent>(_onInitViewSendDeposits);
    on<OnShowViewWebSiteEvent>(_onInitViewWebSite);
    on<OnViewPrintReceiptsEvent>(_onInitViewPrintReceipts);
    on<OnViewReservationsEvent>(_onInitViewReservation);
    on<OnViewFrmDepositEvent>(_onInitViewFrmReservation);
    on<OnViewCargandoEvent>(_onInitCargando);
    on<OnViewLevantaModalEvent>(_onInitLevantaModal);
  }

  Future<void> init() async {
    add( OnNewPositionEvent(
       positionMenu
    ));
    add( OnNewCoordenadasPositionEvent(
       coordenadasMapa
    ));
    add(OnNewFormaPagoEvent(
      formaPago
    ));
    add(OnNewRadioMarcacionEvent(
      radioMarcacion
    ));
    add(OnNewLocalidadMarcacionEvent(
      localidadId
    ));
    add(OnNewIdFormaPagoEvent(
      idFormaPago
    ));
    add(OnNewPositionFormaPagoEvent(
      positionFormaPago
    ));
    
    add( OnShowViewAccountStatementEvent(
       viewAccountStatement
    ));
    add( OnShowViewDebtsEvent(
       viewViewDebts
    ));
    add( OnShowViewSendDepositsEvent(
       viewSendDeposits
    ));
    add( OnShowViewWebSiteEvent(
       viewWebSite
    ));
    add( OnViewPrintReceiptsEvent(
       viewPrintReceipts
    ));
    add( OnViewReservationsEvent(
       viewViewReservations
    ));
    add( OnViewFrmDepositEvent(
       viewFrmDeposits
    ));
    add( OnViewCargandoEvent(
       cargando
    ));
    add( OnViewLevantaModalEvent(
       levantaModal
    ));
  }

  void _onReInitHeight( OnNewCambioHeightModalPlanActEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( heightModalPlanAct: heightModalPlanAct ) );
  }

  void _onReInitPosition( OnNewPositionEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( positionMenu: positionMenu ) );
  }

  void _onReInitPositionMapa( OnNewCoordenadasPositionEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( coordenadasMapa: coordenadasMapa ) );
  }

  void _onCambioFormaPago( OnNewFormaPagoEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( formaPago: formaPago ) );
  }

  void _onCambioRadio( OnNewRadioMarcacionEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( radioMarcacion: radioMarcacion ) );
  }

  void _onCambioIdFormaPago( OnNewIdFormaPagoEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( idFormaPago: idFormaPago ) );
  }

  void _onCambioLocalidad( OnNewLocalidadMarcacionEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( localidadId: localidadId ) );
  }

  void _onInitPositionFormaPago( OnNewPositionFormaPagoEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( positionFormaPago: positionFormaPago ) );
  }

  void _onInitViewAccountStatement( OnShowViewAccountStatementEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( viewAccountStatement: viewAccountStatement ) );
  }

  void _onInitViewViewDebts( OnShowViewDebtsEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( viewViewDebts: viewViewDebts ) );
  }

  void _onInitViewSendDeposits( OnShowViewSendDepositsEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( viewSendDeposits: viewSendDeposits ) );
  }

  void _onInitViewWebSite( OnShowViewWebSiteEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( viewWebSite: viewWebSite ) );
  }

  void _onInitViewPrintReceipts( OnViewPrintReceiptsEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( viewPrintReceipts: viewPrintReceipts ) );
  }

  void _onInitViewReservation( OnViewReservationsEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( viewViewReservations: viewViewReservations ) );
  }

  void _onInitViewFrmReservation( OnViewFrmDepositEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( viewFrmDeposits: viewFrmDeposits ) );
  }

  void _onInitCargando( OnViewCargandoEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( cargando: cargando ) );
  }

  void _onInitLevantaModal( OnViewLevantaModalEvent event, Emitter<GenericState> emit ) {
    emit( state.copyWith( levantaModal: levantaModal ) );
  }

  void setPosicionFormaPago(int varPositionFormaPago) {
    positionFormaPago = varPositionFormaPago;
    add(OnNewPositionFormaPagoEvent(varPositionFormaPago));
  }

  void setLevantaModal(bool varPositionFormaPago) {
    levantaModal = varPositionFormaPago;
    add(OnViewLevantaModalEvent(levantaModal));
  }

  void setCargando(bool varPositionFormaPago) {
    cargando = varPositionFormaPago;
    add(OnViewCargandoEvent(cargando));
  }

  void getPosicion() {
    add(OnNewPositionEvent(positionMenu));
  }

  void setPosicion(int posicionMenu) {
    positionMenu = posicionMenu;
    add(OnNewPositionEvent(posicionMenu));
  }

  void setPosicionMapa(double coordenadasMapas) {
    coordenadasMapa = coordenadasMapas;
    add(OnNewCoordenadasPositionEvent(coordenadasMapas));
  }

  void setFormaPago(String formaPagos) {
    formaPago = formaPagos;
    add(OnNewFormaPagoEvent(formaPagos));
  }

  void setRadioMarcacion(double radioMarcaciones) {
    radioMarcacion = radioMarcaciones;
    add(OnNewRadioMarcacionEvent(radioMarcaciones));
  }

  //OnNewLocalidadMarcacionEvent
  void setLocalidadId(String localidadIdCambiable) {
    localidadId = localidadIdCambiable;
    add(OnNewLocalidadMarcacionEvent(localidadIdCambiable));
  }

  void setIdFormaPago(String idFormaPagos) {
    idFormaPago = idFormaPagos;
    add(OnNewIdFormaPagoEvent(idFormaPagos));
  }

  void setHeightModalPlanAct(double varheightModalPlanAct) {
    heightModalPlanAct = varheightModalPlanAct;
    add(OnNewCambioHeightModalPlanActEvent(heightModalPlanAct));
  }

  void setShowViewAccountStatementEvent(bool varheightModalPlanAct) {
    viewAccountStatement = varheightModalPlanAct;
    add(OnShowViewAccountStatementEvent(viewAccountStatement));
  }

  void setShowViewDebts(bool varheightModalPlanAct) {
    viewViewDebts = varheightModalPlanAct;
    add(OnShowViewDebtsEvent(viewViewDebts));
  }

  void setShowViewSendDeposits(bool varheightModalPlanAct) {
    viewSendDeposits = varheightModalPlanAct;
    add(OnShowViewSendDepositsEvent(viewSendDeposits));
  }

  void setShowViewWebSite(bool varheightModalPlanAct) {
    viewWebSite = varheightModalPlanAct;
    add(OnShowViewWebSiteEvent(viewWebSite));
  }

  void setShowViewPrintRecipts(bool varheightModalPlanAct) {
    viewPrintReceipts = varheightModalPlanAct;
    add(OnViewPrintReceiptsEvent(viewPrintReceipts));
  }

  void setShowViewReservetions(bool varheightModalPlanAct) {
    viewViewReservations = varheightModalPlanAct;
    add(OnViewReservationsEvent(viewViewReservations));
  }

  void setShowViewFrmDeposit(bool varheightModalPlanAct) {
    viewFrmDeposits = varheightModalPlanAct;
    add(OnViewFrmDepositEvent(viewFrmDeposits));
  }

  @override
  //ignore: unnecessary_overrides
  Future<void> close() {
    return super.close();
  }

}

 