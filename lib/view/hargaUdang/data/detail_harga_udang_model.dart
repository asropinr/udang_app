class DetailHargaUdangModel {
  Data? data;

  DetailHargaUdangModel({this.data});

  DetailHargaUdangModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? speciesId;
  String? date;
  int? size20;
  int? size30;
  int? size40;
  int? size50;
  int? size60;
  int? size70;
  int? size80;
  int? size90;
  int? size100;
  int? size110;
  int? size120;
  int? size130;
  int? size140;
  int? size150;
  int? size160;
  int? size170;
  int? size180;
  int? size190;
  int? size200;
  String? remark;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? regionId;
  String? contact;
  String? countryId;
  String? currencyId;
  int? private;
  int? week;
  String? dateRegionFullName;
  String? provinceId;
  String? regencyId;
  String? districtId;
  String? villageId;
  Region? region;
  Creator? creator;

  Data(
      {this.id,
      this.speciesId,
      this.date,
      this.size20,
      this.size30,
      this.size40,
      this.size50,
      this.size60,
      this.size70,
      this.size80,
      this.size90,
      this.size100,
      this.size110,
      this.size120,
      this.size130,
      this.size140,
      this.size150,
      this.size160,
      this.size170,
      this.size180,
      this.size190,
      this.size200,
      this.remark,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.regionId,
      this.contact,
      this.countryId,
      this.currencyId,
      this.private,
      this.week,
      this.dateRegionFullName,
      this.provinceId,
      this.regencyId,
      this.districtId,
      this.villageId,
      this.region,
      this.creator});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] as int : null;
    speciesId = json['species_id'] != null ? json['species_id'] as int : null;
    date = json['date'];
    size20 = json['size_20'] != null ? json['size_20'] as int : null;
    size30 = json['size_30'] != null ? json['size_30'] as int : null;
    size40 = json['size_40'] != null ? json['size_40'] as int : null;
    size50 = json['size_50'] != null ? json['size_50'] as int : null;
    size60 = json['size_60'] != null ? json['size_60'] as int : null;
    size70 = json['size_70'] != null ? json['size_70'] as int : null;
    size80 = json['size_80'] != null ? json['size_80'] as int : null;
    size90 = json['size_90'] != null ? json['size_90'] as int : null;
    size100 = json['size_100'] != null ? json['size_100'] as int : null;
    size110 = json['size_110'] != null ? json['size_110'] as int : null;
    size120 = json['size_120'] != null ? json['size_120'] as int : null;
    size130 = json['size_130'] != null ? json['size_130'] as int : null;
    size140 = json['size_140'] != null ? json['size_140'] as int : null;
    size150 = json['size_150'] != null ? json['size_150'] as int : null;
    size160 = json['size_160'] != null ? json['size_160'] as int : null;
    size170 = json['size_170'] != null ? json['size_170'] as int : null;
    size180 = json['size_180'] != null ? json['size_180'] as int : null;
    size190 = json['size_190'] != null ? json['size_190'] as int : null;
    size200 = json['size_200'] != null ? json['size_200'] as int : null;
    remark = json['remark'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    regionId = json['region_id'];
    contact = json['contact'] != null ? json['contact'] as String : null;
    countryId = json['country_id'];
    currencyId = json['currency_id'];
    private = json['private'];
    week = json['week'];
    dateRegionFullName = json['date_region_full_name'];
    provinceId = json['province_id'];
    regencyId =
        json['regency_id'] != null ? json['regency_id'] as String : null;
    districtId =
        json['district_id'] != null ? json['district_id'] as String : null;
    villageId =
        json['village_id'] != null ? json['village_id'] as String : null;

    region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['species_id'] = this.speciesId;
    data['date'] = this.date;
    data['size_20'] = this.size20;
    data['size_30'] = this.size30;
    data['size_40'] = this.size40;
    data['size_50'] = this.size50;
    data['size_60'] = this.size60;
    data['size_70'] = this.size70;
    data['size_80'] = this.size80;
    data['size_90'] = this.size90;
    data['size_100'] = this.size100;
    data['size_110'] = this.size110;
    data['size_120'] = this.size120;
    data['size_130'] = this.size130;
    data['size_140'] = this.size140;
    data['size_150'] = this.size150;
    data['size_160'] = this.size160;
    data['size_170'] = this.size170;
    data['size_180'] = this.size180;
    data['size_190'] = this.size190;
    data['size_200'] = this.size200;
    data['remark'] = this.remark;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['region_id'] = this.regionId;
    data['contact'] = this.contact;
    data['country_id'] = this.countryId;
    data['currency_id'] = this.currencyId;
    data['private'] = this.private;
    data['week'] = this.week;
    data['date_region_full_name'] = this.dateRegionFullName;
    data['province_id'] = this.provinceId;
    data['regency_id'] = this.regencyId;
    data['district_id'] = this.districtId;
    data['village_id'] = this.villageId;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    return data;
  }
}

class Region {
  String? id;
  String? name;
  int? type;
  String? latitude;
  String? longitude;
  String? countryId;
  String? countryName;
  String? countryNameUppercase;
  String? provinceId;
  String? provinceName;
  String? regencyId;
  String? regencyName;
  String? districtId;
  String? districtName;
  String? villageId;
  String? villageName;
  String? fullName;
  String? nameTranslated;
  String? countryNameTranslated;
  String? countryNameTranslatedUppercase;

  Region(
      {this.id,
      this.name,
      this.type,
      this.latitude,
      this.longitude,
      this.countryId,
      this.countryName,
      this.countryNameUppercase,
      this.provinceId,
      this.provinceName,
      this.regencyId,
      this.regencyName,
      this.districtId,
      this.districtName,
      this.villageId,
      this.villageName,
      this.fullName,
      this.nameTranslated,
      this.countryNameTranslated,
      this.countryNameTranslatedUppercase});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] as String : null;
    name = json['name'] != null ? json['name'] as String : null;
    type = json['type'] != null ? json['type'] as int : null;
    latitude = json['latitude'] != null ? json['latitude'] as String : null;
    longitude = json['longitude'] != null ? json['longitude'] as String : null;
    countryId =
        json['country_id'] != null ? json['country_id'] as String : null;
    countryName =
        json['country_name'] != null ? json['country_name'] as String : null;
    countryNameUppercase = json['country_name_uppercase'] != null
        ? json['country_name_uppercase'] as String
        : null;
    provinceId =
        json['province_id'] != null ? json['province_id'] as String : null;
    provinceName =
        json['province_name'] != null ? json['province_name'] as String : null;
    regencyId =
        json['regency_id'] != null ? json['regency_id'] as String : null;
    regencyName =
        json['regency_name'] != null ? json['regency_name'] as String : null;
    districtId =
        json['district_id'] != null ? json['district_id'] as String : null;
    districtName =
        json['district_name'] != null ? json['district_name'] as String : null;
    villageId =
        json['village_id'] != null ? json['village_id'] as String : null;
    villageName =
        json['village_name'] != null ? json['village_name'] as String : null;
    fullName = json['full_name'] != null ? json['full_name'] as String : null;
    nameTranslated = json['name_translated'] != null
        ? json['name_translated'] as String
        : null;
    countryNameTranslated = json['country_name_translated'] != null
        ? json['country_name_translated'] as String
        : null;
    countryNameTranslatedUppercase =
        json['country_name_translated_uppercase'] != null
            ? json['country_name_translated_uppercase'] as String
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['country_name_uppercase'] = this.countryNameUppercase;
    data['province_id'] = this.provinceId;
    data['province_name'] = this.provinceName;
    data['regency_id'] = this.regencyId;
    data['regency_name'] = this.regencyName;
    data['district_id'] = this.districtId;
    data['district_name'] = this.districtName;
    data['village_id'] = this.villageId;
    data['village_name'] = this.villageName;
    data['full_name'] = this.fullName;
    data['name_translated'] = this.nameTranslated;
    data['country_name_translated'] = this.countryNameTranslated;
    data['country_name_translated_uppercase'] =
        this.countryNameTranslatedUppercase;
    return data;
  }
}

class Creator {
  int? id;
  int? roleId;
  String? name;
  String? email;
  String? avatar;
  bool? emailVerified;
  int? subscriptionTypeId;
  Settings? settings;
  String? createdAt;
  String? updatedAt;
  String? regionId;
  String? address;
  String? lastLoginAt;
  bool? deactivated;
  String? expiredAt;
  String? phone;
  bool? phoneVerified;
  int? gender;
  String? occupation;
  String? idNumber;
  String? idScan;
  String? tinNumber;
  String? tinScan;
  String? birthdate;
  String? company;
  String? companyAddress;
  String? position;
  String? monthlyIncome;
  String? incomeSource;
  bool? buyer;
  String? phoneCountry;
  String? country;
  String? interest;
  String? unsubscribeEmailAt;
  String? freshchatRestoreId;
  bool? allowCreateClient;
  bool? allowCreateToken;
  List<String>? interests;
  // State? state;
  String? familyCardNumber;
  String? familyCardScan;
  String? telegramId;
  String? genderName;
  String? expiredDate;
  String? expiredTime;
  String? upcomingBirthdate;

  Creator(
      {this.id,
      this.roleId,
      this.name,
      this.email,
      this.avatar,
      this.emailVerified,
      this.subscriptionTypeId,
      this.settings,
      this.createdAt,
      this.updatedAt,
      this.regionId,
      this.address,
      this.lastLoginAt,
      this.deactivated,
      this.expiredAt,
      this.phone,
      this.phoneVerified,
      this.gender,
      this.occupation,
      this.idNumber,
      this.idScan,
      this.tinNumber,
      this.tinScan,
      this.birthdate,
      this.company,
      this.companyAddress,
      this.position,
      this.monthlyIncome,
      this.incomeSource,
      this.buyer,
      this.phoneCountry,
      this.country,
      this.interest,
      this.unsubscribeEmailAt,
      this.freshchatRestoreId,
      this.allowCreateClient,
      this.allowCreateToken,
      this.interests,
      // this.state,
      this.familyCardNumber,
      this.familyCardScan,
      this.telegramId,
      this.genderName,
      this.expiredDate,
      this.expiredTime,
      this.upcomingBirthdate});

  Creator.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? json['id'] as int : null;
    roleId = json['role_id'] != null ? json['role_id'] as int : null;
    name = json['name'] != null ? json['name'] as String : null;
    email = json['email'] != null ? json['email'] as String : null;
    avatar = json['avatar'] != null ? json['avatar'] as String : null;
    emailVerified =
        json['email_verified'] != null ? json['email_verified'] as bool : null;
    subscriptionTypeId = json['subscription_type_id'] != null
        ? json['subscription_type_id'] as int
        : null;
    settings = json['settings'] != null
        ? Settings.fromJson(json['settings'] as Map<String, dynamic>)
        : null;
    createdAt =
        json['created_at'] != null ? json['created_at'] as String : null;
    updatedAt =
        json['updated_at'] != null ? json['updated_at'] as String : null;
    regionId = json['region_id'] != null ? json['region_id'] as String : null;
    address = json['address'] != null ? json['address'] as String : null;
    lastLoginAt =
        json['last_login_at'] != null ? json['last_login_at'] as String : null;
    deactivated =
        json['deactivated'] != null ? json['deactivated'] as bool : null;
    expiredAt =
        json['expired_at'] != null ? json['expired_at'] as String : null;
    phone = json['phone'] != null ? json['phone'] as String : null;
    phoneVerified =
        json['phone_verified'] != null ? json['phone_verified'] as bool : null;
    gender = json['gender'] != null ? json['gender'] as int : null;
    occupation =
        json['occupation'] != null ? json['occupation'] as String : null;
    idNumber = json['id_number'] != null ? json['id_number'] as String : null;
    idScan = json['id_scan'] != null ? json['id_scan'] as String : null;
    tinNumber =
        json['tin_number'] != null ? json['tin_number'] as String : null;
    tinScan = json['tin_scan'] != null ? json['tin_scan'] as String : null;
    birthdate = json['birthdate'] != null ? json['birthdate'] as String : null;
    company = json['company'] != null ? json['company'] as String : null;
    companyAddress = json['company_address'] != null
        ? json['company_address'] as String
        : null;
    position = json['position'] != null ? json['position'] as String : null;
    monthlyIncome = json['monthly_income'] != null
        ? json['monthly_income'] as String
        : null;
    incomeSource =
        json['income_source'] != null ? json['income_source'] as String : null;
    buyer = json['buyer'] != null ? json['buyer'] as bool : null;
    phoneCountry =
        json['phone_country'] != null ? json['phone_country'] as String : null;
    country = json['country'] != null ? json['country'] as String : null;
    interest = json['interest'] != null ? json['interest'] as String : null;
    unsubscribeEmailAt = json['unsubscribe_email_at'] != null
        ? json['unsubscribe_email_at'] as String
        : null;
    freshchatRestoreId = json['freshchat_restore_id'] != null
        ? json['freshchat_restore_id'] as String
        : null;
    allowCreateClient = json['allow_create_client'] != null
        ? json['allow_create_client'] as bool
        : null;
    allowCreateToken = json['allow_create_token'] != null
        ? json['allow_create_token'] as bool
        : null;
    interests = json['interests'] != null
        ? List<String>.from(json['interests'] as List<dynamic>)
        : null;
    // state = json['state'] != null
    //     ? State.fromJson(json['state'] as Map<String, dynamic>)
    //     : null;
    familyCardNumber = json['family_card_number'] != null
        ? json['family_card_number'] as String
        : null;
    familyCardScan = json['family_card_scan'] != null
        ? json['family_card_scan'] as String
        : null;
    telegramId =
        json['telegram_id'] != null ? json['telegram_id'] as String : null;
    genderName =
        json['gender_name'] != null ? json['gender_name'] as String : null;
    expiredDate =
        json['expired_date'] != null ? json['expired_date'] as String : null;
    expiredTime =
        json['expired_time'] != null ? json['expired_time'] as String : null;
    upcomingBirthdate = json['upcoming_birthdate'] != null
        ? json['upcoming_birthdate'] as String
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['email_verified'] = this.emailVerified;
    data['subscription_type_id'] = this.subscriptionTypeId;
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['region_id'] = this.regionId;
    data['address'] = this.address;
    data['last_login_at'] = this.lastLoginAt;
    data['deactivated'] = this.deactivated;
    data['expired_at'] = this.expiredAt;
    data['phone'] = this.phone;
    data['phone_verified'] = this.phoneVerified;
    data['gender'] = this.gender;
    data['occupation'] = this.occupation;
    data['id_number'] = this.idNumber;
    data['id_scan'] = this.idScan;
    data['tin_number'] = this.tinNumber;
    data['tin_scan'] = this.tinScan;
    data['birthdate'] = this.birthdate;
    data['company'] = this.company;
    data['company_address'] = this.companyAddress;
    data['position'] = this.position;
    data['monthly_income'] = this.monthlyIncome;
    data['income_source'] = this.incomeSource;
    data['buyer'] = this.buyer;
    data['phone_country'] = this.phoneCountry;
    data['country'] = this.country;
    data['interest'] = this.interest;
    data['unsubscribe_email_at'] = this.unsubscribeEmailAt;
    data['freshchat_restore_id'] = this.freshchatRestoreId;
    data['allow_create_client'] = this.allowCreateClient;
    data['allow_create_token'] = this.allowCreateToken;
    data['interests'] = this.interests;
    // if (this.state != null) {
    //   data['state'] = this.state!.toJson();
    // }
    data['family_card_number'] = this.familyCardNumber;
    data['family_card_scan'] = this.familyCardScan;
    data['telegram_id'] = this.telegramId;
    data['gender_name'] = this.genderName;
    data['expired_date'] = this.expiredDate;
    data['expired_time'] = this.expiredTime;
    data['upcoming_birthdate'] = this.upcomingBirthdate;
    return data;
  }
}

class Settings {
  String? locale;

  Settings({this.locale});

  Settings.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locale'] = this.locale;
    return data;
  }
}

// class State {
//   String? knowJalaFrom;
//   String? phoneVerificationExpiredAt;
//   String? phoneVerificationOtpSent;
//   String? homeCoachmarkShown;
//   String? cycleToDoShown;
//   String? jalaEventShown;
//   String? addCreateFarmCoachmarkShown;
//   String? addCreatePondCoachmarkShown;
//   String? undefined;
//   String? addStartCreateCycleCoachmarkShown;
//   bool? addMeasurementCoachmarkShown;
//   bool? addFeedCoachmarkShown;
//   int? mailjetId;
//   bool? homeNewFeatureCoachmarkShown;
//   bool? homeGraphCoachmarkShown;
//   bool? homeNewFeatureCoachmark147Shown;
//   bool? addSamplingCoachmarkShown;
//   bool? addFeedTrayCoachmarkShown;

//   State(
//       {this.knowJalaFrom,
//       this.phoneVerificationExpiredAt,
//       this.phoneVerificationOtpSent,
//       this.homeCoachmarkShown,
//       this.cycleToDoShown,
//       this.jalaEventShown,
//       this.addCreateFarmCoachmarkShown,
//       this.addCreatePondCoachmarkShown,
//       this.undefined,
//       this.addStartCreateCycleCoachmarkShown,
//       this.addMeasurementCoachmarkShown,
//       this.addFeedCoachmarkShown,
//       this.mailjetId,
//       this.homeNewFeatureCoachmarkShown,
//       this.homeGraphCoachmarkShown,
//       this.homeNewFeatureCoachmark147Shown,
//       this.addSamplingCoachmarkShown,
//       this.addFeedTrayCoachmarkShown});

//   State.fromJson(Map<String, dynamic> json) {
//     knowJalaFrom = json['know_jala_from'];
//     phoneVerificationExpiredAt = json['phone_verification_expired_at'];
//     phoneVerificationOtpSent = json['phone_verification_otp_sent'];
//     homeCoachmarkShown = json['home_coachmark_shown'];
//     cycleToDoShown = json['cycle_to_do_shown'];
//     jalaEventShown = json['jala-event_shown'];
//     addCreateFarmCoachmarkShown = json['add_create_farm_coachmark_shown'];
//     addCreatePondCoachmarkShown = json['add_create_pond_coachmark_shown'];
//     undefined = json['undefined'];
//     addStartCreateCycleCoachmarkShown =
//         json['add_start_create_cycle_coachmark_shown'];
//     addMeasurementCoachmarkShown =
//         json['add_measurement_coachmark_shown'] != null
//             ? json['add_measurement_coachmark_shown'] as bool
//             : null;
//     addFeedCoachmarkShown = json['add_feed_coachmark_shown'] != null
//         ? json['add_feed_coachmark_shown'] as bool
//         : null;
//     mailjetId = json['mailjet_id'];
//     homeNewFeatureCoachmarkShown =
//         json['home_new_feature_coachmark_shown'] != null
//             ? json['home_new_feature_coachmark_shown'] as bool
//             : null;
//     homeGraphCoachmarkShown = json['home_graph_coachmark_shown'] != null
//         ? json['home_graph_coachmark_shown'] as bool
//         : null;
//     homeNewFeatureCoachmark147Shown =
//         json['home_new_feature_coachmark_1_4_7_shown'] != null
//             ? json['home_new_feature_coachmark_1_4_7_shown'] as bool
//             : null;
//     addSamplingCoachmarkShown = json['add_sampling_coachmark_shown'] != null
//         ? json['add_sampling_coachmark_shown'] as bool
//         : null;
//     addFeedTrayCoachmarkShown = json['add_feed_tray_coachmark_shown'] != null
//         ? json['add_feed_tray_coachmark_shown'] as bool
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['know_jala_from'] = this.knowJalaFrom;
//     data['phone_verification_expired_at'] = this.phoneVerificationExpiredAt;
//     data['phone_verification_otp_sent'] = this.phoneVerificationOtpSent;
//     data['home_coachmark_shown'] = this.homeCoachmarkShown;
//     data['cycle_to_do_shown'] = this.cycleToDoShown;
//     data['jala-event_shown'] = this.jalaEventShown;
//     data['add_create_farm_coachmark_shown'] = this.addCreateFarmCoachmarkShown;
//     data['add_create_pond_coachmark_shown'] = this.addCreatePondCoachmarkShown;
//     data['undefined'] = this.undefined;
//     data['add_start_create_cycle_coachmark_shown'] =
//         this.addStartCreateCycleCoachmarkShown;
//     data['add_measurement_coachmark_shown'] = this.addMeasurementCoachmarkShown;
//     data['add_feed_coachmark_shown'] = this.addFeedCoachmarkShown;
//     data['mailjet_id'] = this.mailjetId;
//     data['home_new_feature_coachmark_shown'] =
//         this.homeNewFeatureCoachmarkShown;
//     data['home_graph_coachmark_shown'] = this.homeGraphCoachmarkShown;
//     data['home_new_feature_coachmark_1_4_7_shown'] =
//         this.homeNewFeatureCoachmark147Shown;
//     data['add_sampling_coachmark_shown'] = this.addSamplingCoachmarkShown;
//     data['add_feed_tray_coachmark_shown'] = this.addFeedTrayCoachmarkShown;
//     return data;
//   }
// }
