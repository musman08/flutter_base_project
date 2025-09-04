import 'dart:io';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class RevenueCatService {
  RevenueCatService._();

  static final _instance = RevenueCatService._();

  static RevenueCatService get instance => _instance;
  static const _apiKey = 'appl_KcglWfxNSSAnWcSMtseRelJZUsv';
  static const _googleKey = 'goog_MEtzqbwLkVtnPvwlkBjGnMNLIdD';
  String entitlementID = 'premium';
  late PurchasesConfiguration _configuration;
  CustomerInfo? customerInfo;

  Future initialize() async {
    if (Platform.isAndroid) {
      _configuration = PurchasesConfiguration(_googleKey);
    } else {
      _configuration = PurchasesConfiguration(_apiKey);
    }

    await Purchases.configure(_configuration);
    // await onAuthUserToRevenueCat(email);
  }

  Future<void> onAuthUserToRevenueCat(String userId) async {
    try {
      print("onAuthUserToRevenueCat 1");
      _configuration.appUserID = userId;
      if (userId.isEmpty) return;
      print("onAuthUserToRevenueCat 2");
      await Purchases.logIn(userId);
      print("onAuthUserToRevenueCat 3");
      // final purchaserInfo = await Purchases.getCustomerInfo();
      // print("onAuthUserToRevenueCat ${await Purchases.appUserID}");
      // print("onAuthUserToRevenueCat ${purchaserInfo}");
      await checkUserSubscriptionStatus();
      print("onAuthUserToRevenueCat 4");
    } catch (e) {
      print("onAuthUserToRevenueCat $e");
    }
  }

  Future<List<Package>> fetchSubscriptionPackages() async {
    print("fetchSubscriptionPackages ${entitlementID}");
    try {
      final offerings = await Purchases.getOfferings();
      // final products = Purchases.getProducts([ProductIds.oneMonth, ProductIds.oneYear]);
      // final oooff = offerings.current?.availablePackages;
      print('offfffff: ${offerings}');
      final currentOffering = offerings.all['default'];
      if (currentOffering != null) {
        print('offfffff1111: ${currentOffering.availablePackages}');
        return currentOffering.availablePackages;
        // for (Package package in currentOffering.availablePackages) {
        //   // debugPrint(
        //   //     "package ${package.storeProduct.subscriptionOptions}"
        //   //         " ${package.storeProduct.subscriptionPeriod} "
        //   //         "${package.packageType}"
        //   //         " ${package.storeProduct.title}"
        //   //         " ${package.storeProduct.identifier}");
        //   packages.add(package);
        //   products.add(PackageModel.fromPackage(package));
        // }
      } else {
        print("No subscriptions available");
      }
    } catch (e) {
      print("Error fetching subscriptions: $e");
      rethrow;
    }
    return [];
  }

  // List<PackageModel> packagesToProducts(List<Package> packages) {
  //   return packages.map((e) => PackageModel.fromPackage(e)).toList();
  // }

  Future<CustomerInfo?> checkUserSubscriptionStatus() async {
    try {
      customerInfo = await Purchases.getCustomerInfo();
      return customerInfo;
      // print(
      //     "checkUserSubscriptionStatus: ${customerInfo?.allPurchasedProductIdentifiers}");
      // print("checkUserSubscriptionStatus: ${customerInfo?.originalAppUserId}");
      // print("checkUserSubscriptionStatus: ${customerInfo?.originalAppUserId}");
      // print("checkUserSubscriptionStatus: ${customerInfo?.activeSubscriptions}");
      // print("checkUserSubscriptionStatus: ${customerInfo}");
    } catch (e) {
      rethrow;
      // print("Error checking subscription status: $e");
    }
  }

  Future<CustomerInfo?> purchaseProduct(Package package) async {
    print("purchaseProduct start ");
    try {
      final result = await Purchases.purchasePackage(package);
      customerInfo = result.customerInfo;
      print(
        "Purchase completed successfully ${customerInfo?.activeSubscriptions}",
      );
      print("purchaseProduct End ");
      return customerInfo;
    } catch (e) {
      print("Error purchasing product: $e");

      return null;
    }
  }

  Future<void> restorePurchases() async {
    print("restorePurchases");
    try {
      customerInfo = await Purchases.restorePurchases();

      print(
        "Purchases restored successfully ${customerInfo?.activeSubscriptions}${customerInfo?.allPurchasedProductIdentifiers} ${customerInfo?.allPurchaseDates}",
      );
    } catch (e) {
      print("Error restoring purchases: $e");
    }
  }

  Future<void> onLogOutRevenueCat() async {
    try {
      final logOutUser = await Purchases.logOut();

      print(
        "Purchases Logout successfully ${logOutUser.allPurchasedProductIdentifiers} ${logOutUser.allPurchaseDates}",
      );
    } catch (e) {
      print("Error Logout purchases: $e");
    }
  }

  Future<void> onCancelSubscriptions() async {
    String url = "";
    if (Platform.isAndroid) {
      url = 'https://play.google.com/store/account/subscriptions';
    } else if (Platform.isIOS) {
      url = 'itms-apps://apps.apple.com/account/subscriptions';
    }
    if (url.isNotEmpty) {
      final Uri _url = Uri.parse(url);
      try {
        if (await canLaunchUrl(_url)) {
          await launchUrl(_url, mode: LaunchMode.externalApplication);
        } else {
          if (Platform.isAndroid) {
            throw 'Could not open Play Store subscription page';
          }
          if (Platform.isIOS) {
            throw 'Could not open App Store subscription page';
          }
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  ///TODO: Checking Does this apple account has active purchases
  ///If Current Apple Id has an active subscription then user can not purchase another on the same account
  Future<List<String>> pastPurchases() async {
    final account = await Purchases.restorePurchases();
    // print("canSubscribe ${account.activeSubscriptions} "
    //     "${account.allPurchasedProductIdentifiers} "
    //     "${account.allPurchaseDates}");
    return account.activeSubscriptions;
  }
}
