import 'dart:convert';

RestuarentModel restuarentModelFromMap(String str) => RestuarentModel.fromMap(json.decode(str));

class RestuarentModel {
    String? message;
    String? currentpage;
    String? pagelimit;
    int? count;
    List<Restaurents>? data;
    bool? status;

    RestuarentModel({
        this.message,
        this.currentpage,
        this.pagelimit,
        this.count,
        this.data,
        this.status,
    });

    factory RestuarentModel.fromMap(Map<String, dynamic> json) => RestuarentModel(
        message: json["message"],
        currentpage: json["currentpage"],
        pagelimit: json["pagelimit"],
        count: json["count"],
        data: json["data"] == null ? [] : List<Restaurents>.from(json["data"]!.map((x) => Restaurents.fromMap(x))),
        status: json["status"],
    );

}

class Restaurents {
    int? id;
    String? nameEn;
    String? nameAr;
    int? parentId;
    bool? isFull;
    bool? isOpen;
    int? maxQueue;
    dynamic longitude;
    dynamic latitude;
    bool? isActive;
    DateTime? expiredDate;
    DateTime? creadteDate;
    int? areaId;
    int? createdUser;
    dynamic address;
    dynamic maxGroup;
    dynamic openHour;
    dynamic closeHour;
    int? accountType;
    String? savedTime;
    String? logo;
    bool? manualOpen;
    bool? manualFull;
    String? qrCode;
    int? orderId;
    double? rating;
    dynamic tablesOptions;
    int? reviews;
    dynamic phone;
    int? status;
    bool? insideActive;
    bool? outsideActive;
    bool? isOpenManual;
    bool? insideFull;
    bool? outsideFull;
    int? maxInside;
    int? maxOutside;
    int? qTime;
    bool? userHold;
    int? countryId;
    dynamic cancelReasonRequired;
    String? realTimeChannel;
    int? branchOrderId;
    bool? preOrder;
    String? conditionsEn;
    String? conditionsAr;
    int? queueCost;
    bool? fastTrackEnabled;
    bool? requiredTurnUpgrade;
    int? lilouNotificationNumber;
    String? lilouNotificationMessageEn;
    String? lilouNotificationMessageAr;
    bool? allowFullListAccess;
    String? lilouCustomMessageEn;
    String? lilouCustomMessageAr;
    bool? enableQueueTags;
    bool? requiredTickets;
    bool? onlyWalkIn;
    int? vendorCategory;
    bool? pickupAvailable;
    bool? queueAvailable;
    int? serviceCharges;
    int? vat;
    int? pickupCustomerFees;
    dynamic kioskIsFull;
    dynamic kioskInsideFull;
    dynamic kioskOutsideFull;
    dynamic branchMinQ;
    dynamic insideMinQ;
    dynamic outsideMinQ;
    int? branchCount;
    String? foodTypeEn;
    String? foodTypeAr;

    Restaurents({
        this.id,
        this.nameEn,
        this.nameAr,
        this.parentId,
        this.isFull,
        this.isOpen,
        this.maxQueue,
        this.longitude,
        this.latitude,
        this.isActive,
        this.expiredDate,
        this.creadteDate,
        this.areaId,
        this.createdUser,
        this.address,
        this.maxGroup,
        this.openHour,
        this.closeHour,
        this.accountType,
        this.savedTime,
        this.logo,
        this.manualOpen,
        this.manualFull,
        this.qrCode,
        this.orderId,
        this.rating,
        this.tablesOptions,
        this.reviews,
        this.phone,
        this.status,
        this.insideActive,
        this.outsideActive,
        this.isOpenManual,
        this.insideFull,
        this.outsideFull,
        this.maxInside,
        this.maxOutside,
        this.qTime,
        this.userHold,
        this.countryId,
        this.cancelReasonRequired,
        this.realTimeChannel,
        this.branchOrderId,
        this.preOrder,
        this.conditionsEn,
        this.conditionsAr,
        this.queueCost,
        this.fastTrackEnabled,
        this.requiredTurnUpgrade,
        this.lilouNotificationNumber,
        this.lilouNotificationMessageEn,
        this.lilouNotificationMessageAr,
        this.allowFullListAccess,
        this.lilouCustomMessageEn,
        this.lilouCustomMessageAr,
        this.enableQueueTags,
        this.requiredTickets,
        this.onlyWalkIn,
        this.vendorCategory,
        this.pickupAvailable,
        this.queueAvailable,
        this.serviceCharges,
        this.vat,
        this.pickupCustomerFees,
        this.kioskIsFull,
        this.kioskInsideFull,
        this.kioskOutsideFull,
        this.branchMinQ,
        this.insideMinQ,
        this.outsideMinQ,
        this.branchCount,
        this.foodTypeEn,
        this.foodTypeAr,
    });

    factory Restaurents.fromMap(Map<String, dynamic> json) => Restaurents(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        parentId: json["parentID"],
        isFull: json["isFull"],
        isOpen: json["isOpen"],
        maxQueue: json["maxQueue"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        isActive: json["isActive"],
        expiredDate: json["expiredDate"] == null ? null : DateTime.parse(json["expiredDate"]),
        creadteDate: json["creadteDate"] == null ? null : DateTime.parse(json["creadteDate"]),
        areaId: json["areaId"],
        createdUser: json["createdUser"],
        address: json["address"],
        maxGroup: json["maxGroup"],
        openHour: json["openHour"],
        closeHour: json["closeHour"],
        accountType: json["accountType"],
        savedTime: json["savedTime"],
        logo: json["logo"],
        manualOpen: json["manualOpen"],
        manualFull: json["manualFull"],
        qrCode: json["qrCode"],
        orderId: json["orderId"],
        rating: json["rating"]?.toDouble(),
        tablesOptions: json["tablesOptions"],
        reviews: json["reviews"],
        phone: json["phone"],
        status: json["status"],
        insideActive: json["insideActive"],
        outsideActive: json["outsideActive"],
        isOpenManual: json["isOpenManual"],
        insideFull: json["insideFull"],
        outsideFull: json["outsideFull"],
        maxInside: json["maxInside"],
        maxOutside: json["maxOutside"],
        qTime: json["qTime"],
        userHold: json["userHold"],
        countryId: json["countryID"],
        cancelReasonRequired: json["cancelReasonRequired"],
        realTimeChannel: json["realTimeChannel"],
        branchOrderId: json["branchOrderID"],
        preOrder: json["preOrder"],
        conditionsEn: json["conditionsEn"],
        conditionsAr: json["conditionsAr"],
        queueCost: json["QueueCost"],
        fastTrackEnabled: json["FastTrackEnabled"],
        requiredTurnUpgrade: json["RequiredTurnUpgrade"],
        lilouNotificationNumber: json["LilouNotificationNumber"],
        lilouNotificationMessageEn: json["LilouNotificationMessageEn"],
        lilouNotificationMessageAr: json["LilouNotificationMessageAr"],
        allowFullListAccess: json["AllowFullListAccess"],
        lilouCustomMessageEn: json["LilouCustomMessageEn"],
        lilouCustomMessageAr: json["LilouCustomMessageAr"],
        enableQueueTags: json["EnableQueueTags"],
        requiredTickets: json["RequiredTickets"],
        onlyWalkIn: json["OnlyWalkIn"],
        vendorCategory: json["VendorCategory"],
        pickupAvailable: json["PickupAvailable"],
        queueAvailable: json["QueueAvailable"],
        serviceCharges: json["ServiceCharges"],
        vat: json["Vat"],
        pickupCustomerFees: json["PickupCustomerFees"],
        kioskIsFull: json["KioskIsFull"],
        kioskInsideFull: json["KioskInsideFull"],
        kioskOutsideFull: json["KioskOutsideFull"],
        branchMinQ: json["BranchMinQ"],
        insideMinQ: json["InsideMinQ"],
        outsideMinQ: json["OutsideMinQ"],
        branchCount: json["branchCount"],
        foodTypeEn: json["foodTypeEN"],
        foodTypeAr: json["foodTypeAr"],
    );
}
