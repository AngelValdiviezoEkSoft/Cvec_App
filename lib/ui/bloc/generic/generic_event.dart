part of 'generic_bloc.dart';

abstract class GenericEvent extends Equatable {
  const GenericEvent();

  @override
  List<Object> get props => [];
}


class CambioGenericEvent extends GenericEvent { 
  final bool isGenericEnabled;
  const CambioGenericEvent({required this.isGenericEnabled});
}

class OnNewPositionEvent extends GenericEvent {
  final int positionMenu;
  const OnNewPositionEvent(this.positionMenu);
}

class OnNewPositionFormaPagoEvent extends GenericEvent {
  final int positionFormaPago;
  const OnNewPositionFormaPagoEvent(this.positionFormaPago);
}

class OnNewCoordenadasPositionEvent extends GenericEvent {
  final double positionCoordenadasMenu;
  const OnNewCoordenadasPositionEvent(this.positionCoordenadasMenu);
}

class OnNewFormaPagoEvent extends GenericEvent {
  final String formaPago;
  const OnNewFormaPagoEvent(this.formaPago);
}

class OnNewRadioMarcacionEvent extends GenericEvent {
  final double radioMarcacion;
  const OnNewRadioMarcacionEvent(this.radioMarcacion);
}

class OnNewLocalidadMarcacionEvent extends GenericEvent {
  final String localidadId;
  const OnNewLocalidadMarcacionEvent(this.localidadId);
}

class OnNewIdFormaPagoEvent extends GenericEvent {
  final String idFormaPago;
  const OnNewIdFormaPagoEvent(this.idFormaPago);
}

class OnNewCambioHeightModalPlanActEvent extends GenericEvent {
  final double height;
  const OnNewCambioHeightModalPlanActEvent(this.height);
}

class OnShowViewAccountStatementEvent extends GenericEvent {
  final bool showIt;
  const OnShowViewAccountStatementEvent(this.showIt);
}

class OnShowViewDebtsEvent extends GenericEvent {
  final bool showIt;
  const OnShowViewDebtsEvent(this.showIt);
}

class OnShowViewSendDepositsEvent extends GenericEvent {
  final bool showIt;
  const OnShowViewSendDepositsEvent(this.showIt);
}

class OnViewPrintReceiptsEvent extends GenericEvent {
  final bool showIt;
  const OnViewPrintReceiptsEvent(this.showIt);
}

class OnViewReservationsEvent extends GenericEvent {
  final bool showIt;
  const OnViewReservationsEvent(this.showIt);
}