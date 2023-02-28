class Purchase {
  int? id;
  String? purchaseRequestedUser;
  int? purchaseStatus;
  String? purchaseDateTo;
  // DateTime? purchaseCompletionDate;
  int? purchaseTayeedUser;

  Purchase(
      {this.id,
      this.purchaseRequestedUser,
      this.purchaseStatus,
      this.purchaseDateTo,
      // this.purchaseCompletionDate,
      this.purchaseTayeedUser});

  Purchase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purchaseRequestedUser = json['PurchaseRequestedUser'];
    purchaseStatus = json['PurchaseStatus'];
    purchaseDateTo = json['PurchaseDateTo'];
    // purchaseCompletionDate = json['PurchaseCompletionDate'];
    purchaseTayeedUser = json['PurchaseTayeedUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['PurchaseRequestedUser'] = this.purchaseRequestedUser;
    data['PurchaseStatus'] = this.purchaseStatus;
    data['PurchaseDateTo'] = this.purchaseDateTo;
    // data['PurchaseCompletionDate'] = this.purchaseCompletionDate;
    data['PurchaseTayeedUser'] = this.purchaseTayeedUser;
    return data;
  }
}
