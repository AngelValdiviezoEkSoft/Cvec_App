class SubscriptionResponseModel {
  final String jsonrpc;
  final dynamic id;
  final SubscriptionResponse result;

  SubscriptionResponseModel({
    required this.jsonrpc,
    required this.id,
    required this.result,
  });

  factory SubscriptionResponseModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionResponseModel(
      jsonrpc: json['jsonrpc'] ?? '',
      id: json['id'] ?? 0,
      result: json['result'] != null ? SubscriptionResponse.fromJson(json['result']) 
      : SubscriptionResponse(data: SaleSubscriptionData(data: [], fields: '', length: 0), estado: 0),
    );
  }
}

class SubscriptionResponse {
  final int estado;
  final SaleSubscriptionData data;

  SubscriptionResponse({
    required this.estado,
    required this.data,
  });

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return SubscriptionResponse(
      estado: json['estado'] ?? '',
      data: json['data']['sale.subscription'] != null ? SaleSubscriptionData.fromJson(json['data']['sale.subscription'])
      : SaleSubscriptionData(data: [], fields: '', length: 0),
    );
  }
}

class SaleSubscriptionData {
  final int length;
  final String fields;
  final List<Subscription> data;

  SaleSubscriptionData({
    required this.length,
    required this.fields,
    required this.data,
  });

  factory SaleSubscriptionData.fromJson(Map<String, dynamic> json) {
    print('Result: ${json['data']}');

    return SaleSubscriptionData(
      length: json['length'] ?? 0,
      fields: '',//json['fields'] ?? '',
      data: json['data'] != null ? //List<Subscription>.from(json['data'].map((x) => Subscription.fromJson(x))) : [],
      
      (json['data'] as List)
          .map((item) => Subscription.fromJson(item))
          .toList() : [],
          
    );
  }
}

class Subscription {
  final int contractId;
  final String contractName;
  final String contractPlan;
  final String contractInscriptionDate;
  final double contractResidual;

  final String contractDueDate;
  final double contractTotalAmount;
  final double contractPaidAmount;
  final double contractPaidPercent;
  final String contractState;

  Subscription({
    required this.contractId,
    required this.contractName,
    required this.contractPlan,
    required this.contractInscriptionDate,
    required this.contractResidual,

    required this.contractDueDate,
    required this.contractTotalAmount,
    required this.contractPaidAmount,
    required this.contractPaidPercent,
    required this.contractState
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      contractId: json['contract_id'] ?? 0,
      contractName: json['contract_name'] ?? '',
      contractPlan: json['contract_plan'] ?? '',
      contractInscriptionDate: json['contract_inscription_date'] ?? '',
      contractResidual: json['contract_residual'] != null ? (json['contract_residual'] as num).toDouble() : 0,

      contractDueDate: json['contract_due_date'] ?? '',
      contractTotalAmount: json['contract_total_amount'] != null ? (json['contract_total_amount'] as num).toDouble() : 0,//json[''] ?? '',
      contractPaidAmount: json['contract_paid_amount'] != null ? (json['contract_paid_amount'] as num).toDouble() : 0,//json[''] ?? '',
      contractPaidPercent: json['contract_paid_percent'] != null ? (json['contract_paid_percent'] as num).toDouble() : 0,//json[''] ?? '',
      contractState: json['contract_state'] ?? '',
    );
  }
}
