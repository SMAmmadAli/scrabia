// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      position: json['position'] as String?,
      email: json['email'] as String?,
      contactNumber: json['contactNumber'] as String?,
      userType: json['userType'] as List<dynamic>?,
      companyNameAr: json['companyNameAr'],
      companyNameEn: json['companyNameEn'],
      commercialRegNumber: json['commercialRegNumber'],
      crExpirationDate: json['crExpirationDate'],
      vatNumber: json['vatNumber'],
      legalEntityType: json['legalEntityType'],
      region: json['region'],
      city: json['city'],
      district: json['district'],
      street: json['street'],
      officialNumber: json['officialNumber'],
      authorizedSignatory: json['authorizedSignatory'],
      jobTitle: json['jobTitle'],
      addressEmail: json['addressEmail'],
      bankName: json['bankName'],
      branch: json['branch'],
      accountNumber: json['accountNumber'],
      ibanNumber: json['ibanNumber'],
      beneficiaryName: json['beneficiaryName'],
      mainActivity: json['mainActivity'] as List<dynamic>?,
      natureOfMaterials: json['natureOfMaterials'] as List<dynamic>?,
      typesOfScrapTraded: json['typesOfScrapTraded'] as List<dynamic>?,
      averageAnnualTurnover: json['averageAnnualTurnover'],
      transportationService: json['transportationService'],
      commercialRegister: json['commercialRegister'],
      chamberOfCommerceCertificate: json['chamberOfCommerceCertificate'],
      vatCertificate: json['vatCertificate'],
      bankAccountConfirmation: json['bankAccountConfirmation'],
      environmentalIndustrialLicense: json['environmentalIndustrialLicense'],
      userAuthorizationLetter: json['userAuthorizationLetter'],
      termsOfUse: json['termsOfUse'],
      legalDeclaration: json['legalDeclaration'],
      accountStatus: json['accountStatus'] as String?,
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      userDetails: json['userDetails'],
      roles: json['roles'] as List<dynamic>?,
      preferredCategories: json['preferredCategories'] as List<dynamic>?,
      sellerCommissionRate: json['sellerCommissionRate'],
      buyerCommissionRate: json['buyerCommissionRate'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'position': instance.position,
      'email': instance.email,
      'contactNumber': instance.contactNumber,
      'userType': instance.userType,
      'companyNameAr': instance.companyNameAr,
      'companyNameEn': instance.companyNameEn,
      'commercialRegNumber': instance.commercialRegNumber,
      'crExpirationDate': instance.crExpirationDate,
      'vatNumber': instance.vatNumber,
      'legalEntityType': instance.legalEntityType,
      'region': instance.region,
      'city': instance.city,
      'district': instance.district,
      'street': instance.street,
      'officialNumber': instance.officialNumber,
      'authorizedSignatory': instance.authorizedSignatory,
      'jobTitle': instance.jobTitle,
      'addressEmail': instance.addressEmail,
      'bankName': instance.bankName,
      'branch': instance.branch,
      'accountNumber': instance.accountNumber,
      'ibanNumber': instance.ibanNumber,
      'beneficiaryName': instance.beneficiaryName,
      'mainActivity': instance.mainActivity,
      'natureOfMaterials': instance.natureOfMaterials,
      'typesOfScrapTraded': instance.typesOfScrapTraded,
      'averageAnnualTurnover': instance.averageAnnualTurnover,
      'transportationService': instance.transportationService,
      'commercialRegister': instance.commercialRegister,
      'chamberOfCommerceCertificate': instance.chamberOfCommerceCertificate,
      'vatCertificate': instance.vatCertificate,
      'bankAccountConfirmation': instance.bankAccountConfirmation,
      'environmentalIndustrialLicense': instance.environmentalIndustrialLicense,
      'userAuthorizationLetter': instance.userAuthorizationLetter,
      'termsOfUse': instance.termsOfUse,
      'legalDeclaration': instance.legalDeclaration,
      'accountStatus': instance.accountStatus,
      'creationDate': instance.creationDate?.toIso8601String(),
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'userDetails': instance.userDetails,
      'roles': instance.roles,
      'preferredCategories': instance.preferredCategories,
      'sellerCommissionRate': instance.sellerCommissionRate,
      'buyerCommissionRate': instance.buyerCommissionRate,
    };
