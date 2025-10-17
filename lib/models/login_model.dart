import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
    @JsonKey(name: "user")
    final User? user;
    @JsonKey(name: "token")
    final String? token;

    LoginModel({
        this.user,
        this.token,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

    Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable()
class User {
    @JsonKey(name: "id")
    final String? id;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "position")
    final String? position;
    @JsonKey(name: "email")
    final String? email;
    @JsonKey(name: "contactNumber")
    final String? contactNumber;
    @JsonKey(name: "userType")
    final List<dynamic>? userType;
    @JsonKey(name: "companyNameAr")
    final dynamic companyNameAr;
    @JsonKey(name: "companyNameEn")
    final dynamic companyNameEn;
    @JsonKey(name: "commercialRegNumber")
    final dynamic commercialRegNumber;
    @JsonKey(name: "crExpirationDate")
    final dynamic crExpirationDate;
    @JsonKey(name: "vatNumber")
    final dynamic vatNumber;
    @JsonKey(name: "legalEntityType")
    final dynamic legalEntityType;
    @JsonKey(name: "region")
    final dynamic region;
    @JsonKey(name: "city")
    final dynamic city;
    @JsonKey(name: "district")
    final dynamic district;
    @JsonKey(name: "street")
    final dynamic street;
    @JsonKey(name: "officialNumber")
    final dynamic officialNumber;
    @JsonKey(name: "authorizedSignatory")
    final dynamic authorizedSignatory;
    @JsonKey(name: "jobTitle")
    final dynamic jobTitle;
    @JsonKey(name: "addressEmail")
    final dynamic addressEmail;
    @JsonKey(name: "bankName")
    final dynamic bankName;
    @JsonKey(name: "branch")
    final dynamic branch;
    @JsonKey(name: "accountNumber")
    final dynamic accountNumber;
    @JsonKey(name: "ibanNumber")
    final dynamic ibanNumber;
    @JsonKey(name: "beneficiaryName")
    final dynamic beneficiaryName;
    @JsonKey(name: "mainActivity")
    final List<dynamic>? mainActivity;
    @JsonKey(name: "natureOfMaterials")
    final List<dynamic>? natureOfMaterials;
    @JsonKey(name: "typesOfScrapTraded")
    final List<dynamic>? typesOfScrapTraded;
    @JsonKey(name: "averageAnnualTurnover")
    final dynamic averageAnnualTurnover;
    @JsonKey(name: "transportationService")
    final dynamic transportationService;
    @JsonKey(name: "commercialRegister")
    final dynamic commercialRegister;
    @JsonKey(name: "chamberOfCommerceCertificate")
    final dynamic chamberOfCommerceCertificate;
    @JsonKey(name: "vatCertificate")
    final dynamic vatCertificate;
    @JsonKey(name: "bankAccountConfirmation")
    final dynamic bankAccountConfirmation;
    @JsonKey(name: "environmentalIndustrialLicense")
    final dynamic environmentalIndustrialLicense;
    @JsonKey(name: "userAuthorizationLetter")
    final dynamic userAuthorizationLetter;
    @JsonKey(name: "termsOfUse")
    final dynamic termsOfUse;
    @JsonKey(name: "legalDeclaration")
    final dynamic legalDeclaration;
    @JsonKey(name: "accountStatus")
    final String? accountStatus;
    @JsonKey(name: "creationDate")
    final DateTime? creationDate;
    @JsonKey(name: "lastLogin")
    final DateTime? lastLogin;
    @JsonKey(name: "userDetails")
    final dynamic userDetails;
    @JsonKey(name: "roles")
    final List<dynamic>? roles;
    @JsonKey(name: "preferredCategories")
    final List<dynamic>? preferredCategories;
    @JsonKey(name: "sellerCommissionRate")
    final dynamic sellerCommissionRate;
    @JsonKey(name: "buyerCommissionRate")
    final dynamic buyerCommissionRate;

    User({
        this.id,
        this.name,
        this.position,
        this.email,
        this.contactNumber,
        this.userType,
        this.companyNameAr,
        this.companyNameEn,
        this.commercialRegNumber,
        this.crExpirationDate,
        this.vatNumber,
        this.legalEntityType,
        this.region,
        this.city,
        this.district,
        this.street,
        this.officialNumber,
        this.authorizedSignatory,
        this.jobTitle,
        this.addressEmail,
        this.bankName,
        this.branch,
        this.accountNumber,
        this.ibanNumber,
        this.beneficiaryName,
        this.mainActivity,
        this.natureOfMaterials,
        this.typesOfScrapTraded,
        this.averageAnnualTurnover,
        this.transportationService,
        this.commercialRegister,
        this.chamberOfCommerceCertificate,
        this.vatCertificate,
        this.bankAccountConfirmation,
        this.environmentalIndustrialLicense,
        this.userAuthorizationLetter,
        this.termsOfUse,
        this.legalDeclaration,
        this.accountStatus,
        this.creationDate,
        this.lastLogin,
        this.userDetails,
        this.roles,
        this.preferredCategories,
        this.sellerCommissionRate,
        this.buyerCommissionRate,
    });

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);
}
