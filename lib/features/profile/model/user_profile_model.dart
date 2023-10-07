import 'dart:convert';

UserProfileModel userProfileModelFromMap(String str) =>
    UserProfileModel.fromMap(json.decode(str));

class UserProfileModel {
  String? message;
  bool? success;
  List<UserProfileDatum>? userProfileData;

  UserProfileModel({
    this.message,
    this.success,
    this.userProfileData,
  });

  factory UserProfileModel.fromMap(Map<String, dynamic> json) =>
      UserProfileModel(
        message: json["message"],
        success: json["success"],
        userProfileData: json["data"] == null
            ? []
            : List<UserProfileDatum>.from(
                json["data"]!.map(
                  (x) => UserProfileDatum.fromMap(x),
                ),
              ),
      );
}

class UserProfileDatum {
  int? clientId;
  String? clientName;
  String? clientPhone;
  DateTime? createdDate;
  bool? clientStatus;
  int? clientGender;
  String? password;
  String? mail;
  dynamic birthDate;
  int? points;
  String? longitude;
  String? latitude;
  int? country;
  String? savedTime;
  int? createdMethod;
  int? userId;
  int? restId;
  DateTime? lastSeen;
  dynamic avatar;
  int? activationStep;
  int? walletBalance;
  String? realTimeChannel;
  int? freeQueue;
  int? subscription;
  DateTime? subscriptionExpiredOn;
  int? totalQueue;
  bool? addedFreeQueue;
  dynamic loginPassword;
  bool? hasApp;
  dynamic providerId;
  dynamic otp;
  dynamic online;
  dynamic id;
  dynamic userid;
  dynamic username;
  dynamic bio;
  List<Setting>? setting;
  Connections? connections;
  Connections? userconnections;
  Followlist? followlist;

  UserProfileDatum({
    this.clientId,
    this.clientName,
    this.clientPhone,
    this.createdDate,
    this.clientStatus,
    this.clientGender,
    this.password,
    this.mail,
    this.birthDate,
    this.points,
    this.longitude,
    this.latitude,
    this.country,
    this.savedTime,
    this.createdMethod,
    this.userId,
    this.restId,
    this.lastSeen,
    this.avatar,
    this.activationStep,
    this.walletBalance,
    this.realTimeChannel,
    this.freeQueue,
    this.subscription,
    this.subscriptionExpiredOn,
    this.totalQueue,
    this.addedFreeQueue,
    this.loginPassword,
    this.hasApp,
    this.providerId,
    this.otp,
    this.online,
    this.id,
    this.userid,
    this.username,
    this.bio,
    this.setting,
    this.connections,
    this.userconnections,
    this.followlist,
  });

  factory UserProfileDatum.fromMap(Map<String, dynamic> json) =>
      UserProfileDatum(
        clientId: json["client_id"],
        clientName: json["client_name"],
        clientPhone: json["client_phone"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        clientStatus: json["client_status"],
        clientGender: json["client_gender"],
        password: json["password"],
        mail: json["mail"],
        birthDate: json["birthDate"],
        points: json["points"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        country: json["country"],
        savedTime: json["savedTime"],
        createdMethod: json["createdMethod"],
        userId: json["userId"],
        restId: json["restId"],
        lastSeen:
            json["lastSeen"] == null ? null : DateTime.parse(json["lastSeen"]),
        avatar: json["avatar"],
        activationStep: json["activationStep"],
        walletBalance: json["walletBalance"],
        realTimeChannel: json["realTimeChannel"],
        freeQueue: json["freeQueue"],
        subscription: json["subscription"],
        subscriptionExpiredOn: json["subscriptionExpiredOn"] == null
            ? null
            : DateTime.parse(json["subscriptionExpiredOn"]),
        totalQueue: json["totalQueue"],
        addedFreeQueue: json["AddedFreeQueue"],
        loginPassword: json["LoginPassword"],
        hasApp: json["hasApp"],
        providerId: json["ProviderId"],
        otp: json["OTP"],
        online: json["online"],
        id: json["id"],
        userid: json["Userid"],
        username: json["Username"],
        bio: json["Bio"],
        setting: json["setting"] == null
            ? []
            : List<Setting>.from(
                json["setting"]!.map((x) => Setting.fromMap(x))),
        connections: json["connections"] == null
            ? null
            : Connections.fromMap(json["connections"]),
        userconnections: json["userconnections"] == null
            ? null
            : Connections.fromMap(json["userconnections"]),
        followlist: json["followlist"] == null
            ? null
            : Followlist.fromMap(json["followlist"]),
      );
}

class Connections {
  int? followList;
  int? blockList;
  int? muteList;

  Connections({
    this.followList,
    this.blockList,
    this.muteList,
  });

  factory Connections.fromMap(Map<String, dynamic> json) => Connections(
        followList: json["follow_list"],
        blockList: json["block_list"],
        muteList: json["mute_list"],
      );
}

class Followlist {
  int? following;
  int? follower;

  Followlist({
    this.following,
    this.follower,
  });

  factory Followlist.fromMap(Map<String, dynamic> json) => Followlist(
        following: json["following"],
        follower: json["follower"],
      );
}

class Setting {
  int? id;
  String? country;
  String? language;
  int? termOfCondition;
  int? chatMessages;
  int? notificationSound;
  int? profilePrivate;
  int? queueVisible;
  int? myOrder;
  int? seated;
  int? chatPrivicy;
  int? commentFromAnyone;
  int? notification;
  int? userId;

  Setting({
    this.id,
    this.country,
    this.language,
    this.termOfCondition,
    this.chatMessages,
    this.notificationSound,
    this.profilePrivate,
    this.queueVisible,
    this.myOrder,
    this.seated,
    this.chatPrivicy,
    this.commentFromAnyone,
    this.notification,
    this.userId,
  });

  factory Setting.fromMap(Map<String, dynamic> json) => Setting(
        id: json["id"],
        country: json["Country"],
        language: json["language"],
        termOfCondition: json["Term_Of_Condition"],
        chatMessages: json["Chat_Messages"],
        notificationSound: json["Notification_Sound"],
        profilePrivate: json["Profile_Private"],
        queueVisible: json["Queue_visible"],
        myOrder: json["my_Order"],
        seated: json["Seated"],
        chatPrivicy: json["Chat_Privicy"],
        commentFromAnyone: json["Comment_From_Anyone"],
        notification: json["Notification"],
        userId: json["UserID"],
      );
}
