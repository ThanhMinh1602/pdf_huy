// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e03_r00002_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$E03R00002StateCWProxy {
  E03R00002State isLoading(bool isLoading);

  E03R00002State pdfFilel(Uint8List? pdfFilel);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `E03R00002State(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// E03R00002State(...).copyWith(id: 12, name: "My name")
  /// ````
  E03R00002State call({
    bool? isLoading,
    Uint8List? pdfFilel,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfE03R00002State.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfE03R00002State.copyWith.fieldName(...)`
class _$E03R00002StateCWProxyImpl implements _$E03R00002StateCWProxy {
  const _$E03R00002StateCWProxyImpl(this._value);

  final E03R00002State _value;

  @override
  E03R00002State isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  E03R00002State pdfFilel(Uint8List? pdfFilel) => this(pdfFilel: pdfFilel);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `E03R00002State(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// E03R00002State(...).copyWith(id: 12, name: "My name")
  /// ````
  E03R00002State call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? pdfFilel = const $CopyWithPlaceholder(),
  }) {
    return E03R00002State(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      pdfFilel: pdfFilel == const $CopyWithPlaceholder()
          ? _value.pdfFilel
          // ignore: cast_nullable_to_non_nullable
          : pdfFilel as Uint8List?,
    );
  }
}

extension $E03R00002StateCopyWith on E03R00002State {
  /// Returns a callable class that can be used as follows: `instanceOfE03R00002State.copyWith(...)` or like so:`instanceOfE03R00002State.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$E03R00002StateCWProxy get copyWith => _$E03R00002StateCWProxyImpl(this);
}
