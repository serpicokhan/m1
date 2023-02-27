import 'dart:convert' show utf8;

class Purchase {
  int? id;
  String? purchaseRequestRequestedUser;
  // int? purchaseRequestStatus;
  // DateTime? purchaseRequestCompletionDate;
  // String? purchaseRequestMoreInfo;
  // bool? purchaseRequestAssetNotInInventory;
  // double? purchaseRequestAssetQty;
  // int? purchaseRequestAssetQtyNot;
  // bool? purchaseRequestAssetNot;
  // bool? purchaseRequestNotInList;
  // String? purchaseRequestDateTo;
  // String? settingTimestamp;
  // String? purchaseRequestTayeedUser;
  // int? purchaseRequestPartName;
  // int? purchaseRequestAsset;
  // int? purchaseRequestAssetMakan;
  // String? purchaseRequestAuthUser;
  // String? purchaseRequestPurchase;

  Purchase({
    this.id,
    this.purchaseRequestRequestedUser,
    //     this.purchaseRequestStatus,
    //     this.purchaseRequestCompletionDate,
    //     this.purchaseRequestMoreInfo,
    //     this.purchaseRequestAssetNotInInventory,
    //     this.purchaseRequestAssetQty,
    //     this.purchaseRequestAssetQtyNot,
    //     this.purchaseRequestAssetNot,
    //     this.purchaseRequestNotInList,
    //     this.purchaseRequestDateTo,
    //     this.settingTimestamp,
    //     this.purchaseRequestTayeedUser,
    //     this.purchaseRequestPartName,
    //     this.purchaseRequestAsset,
    //     this.purchaseRequestAssetMakan,
    //     this.purchaseRequestAuthUser,
    //     this.purchaseRequestPurchase
  });

  Purchase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purchaseRequestRequestedUser = json['PurchaseRequestRequestedUser'];
    //json['PurchaseRequestRequestedUser'];
    //   purchaseRequestStatus = json['PurchaseRequestStatus'];
    //   purchaseRequestCompletionDate = json['PurchaseRequestCompletionDate'];
    //   purchaseRequestMoreInfo = json['PurchaseRequestMoreInfo'];
    //   purchaseRequestAssetNotInInventory =
    //       json['PurchaseRequestAssetNotInInventory'];
    //   purchaseRequestAssetQty = json['PurchaseRequestAssetQty'];
    //   purchaseRequestAssetQtyNot = json['PurchaseRequestAssetQtyNot'];
    //   purchaseRequestAssetNot = json['PurchaseRequestAssetNot'];
    //   purchaseRequestNotInList = json['PurchaseRequestNotInList'];
    //   purchaseRequestDateTo = json['PurchaseRequestDateTo'];
    // settingTimestamp = json['settingTimestamp'];
    //   purchaseRequestTayeedUser = json['PurchaseRequestTayeedUser'];
    //   purchaseRequestPartName = json['PurchaseRequestPartName'];
    //   purchaseRequestAsset = json['PurchaseRequestAsset'];
    //   purchaseRequestAssetMakan = json['PurchaseRequestAssetMakan'];
    //   purchaseRequestAuthUser = json['PurchaseRequestAuthUser'];
    //   purchaseRequestPurchase = json['PurchaseRequestPurchase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['PurchaseRequestRequestedUser'] = this.purchaseRequestRequestedUser;
    // data['PurchaseRequestStatus'] = this.purchaseRequestStatus;
    // data['PurchaseRequestCompletionDate'] = this.purchaseRequestCompletionDate;
    // data['PurchaseRequestMoreInfo'] = this.purchaseRequestMoreInfo;
    // data['PurchaseRequestAssetNotInInventory'] =
    //     this.purchaseRequestAssetNotInInventory;
    // data['PurchaseRequestAssetQty'] = this.purchaseRequestAssetQty;
    // data['PurchaseRequestAssetQtyNot'] = this.purchaseRequestAssetQtyNot;
    // data['PurchaseRequestAssetNot'] = this.purchaseRequestAssetNot;
    // data['PurchaseRequestNotInList'] = this.purchaseRequestNotInList;
    // data['PurchaseRequestDateTo'] = this.purchaseRequestDateTo;
    // data['settingTimestamp'] = this.settingTimestamp;
    // data['PurchaseRequestTayeedUser'] = this.purchaseRequestTayeedUser;
    // data['PurchaseRequestPartName'] = this.purchaseRequestPartName;
    // data['PurchaseRequestAsset'] = this.purchaseRequestAsset;
    // data['PurchaseRequestAssetMakan'] = this.purchaseRequestAssetMakan;
    // data['PurchaseRequestAuthUser'] = this.purchaseRequestAuthUser;
    // data['PurchaseRequestPurchase'] = this.purchaseRequestPurchase;
    return data;
  }
}
