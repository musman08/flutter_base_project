// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(firebaseServices)
const firebaseServicesProvider = FirebaseServicesProvider._();

final class FirebaseServicesProvider
    extends
        $FunctionalProvider<
          FirebaseServices,
          FirebaseServices,
          FirebaseServices
        >
    with $Provider<FirebaseServices> {
  const FirebaseServicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseServicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseServicesHash();

  @$internal
  @override
  $ProviderElement<FirebaseServices> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseServices create(Ref ref) {
    return firebaseServices(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseServices value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseServices>(value),
    );
  }
}

String _$firebaseServicesHash() => r'60fc438876ca5664852024558e66f4596af3523e';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
