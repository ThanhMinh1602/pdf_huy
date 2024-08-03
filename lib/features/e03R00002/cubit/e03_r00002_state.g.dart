// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e03_r00002_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$E03R00002StateCWProxy {
  E03R00002State isLoading(bool isLoading);

  E03R00002State filePickerResult(FilePickerResult? filePickerResult);

  E03R00002State pdfFileModels(List<PdfFileModel>? pdfFileModels);

  E03R00002State createdAt(String? createdAt);

  E03R00002State profileType(String? profileType);

  E03R00002State signatory(String? signatory);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `E03R00002State(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// E03R00002State(...).copyWith(id: 12, name: "My name")
  /// ````
  E03R00002State call({
    bool? isLoading,
    FilePickerResult? filePickerResult,
    List<PdfFileModel>? pdfFileModels,
    String? createdAt,
    String? profileType,
    String? signatory,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfE03R00002State.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfE03R00002State.copyWith.fieldName(...)`
class _$E03R00002StateCWProxyImpl implements _$E03R00002StateCWProxy {
  const _$E03R00002StateCWProxyImpl(this._value);

  final E03R00002State _value;

  @override
  E03R00002State isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  E03R00002State filePickerResult(FilePickerResult? filePickerResult) =>
      this(filePickerResult: filePickerResult);

  @override
  E03R00002State pdfFileModels(List<PdfFileModel>? pdfFileModels) =>
      this(pdfFileModels: pdfFileModels);

  @override
  E03R00002State createdAt(String? createdAt) => this(createdAt: createdAt);

  @override
  E03R00002State profileType(String? profileType) =>
      this(profileType: profileType);

  @override
  E03R00002State signatory(String? signatory) => this(signatory: signatory);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `E03R00002State(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// E03R00002State(...).copyWith(id: 12, name: "My name")
  /// ````
  E03R00002State call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? filePickerResult = const $CopyWithPlaceholder(),
    Object? pdfFileModels = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? profileType = const $CopyWithPlaceholder(),
    Object? signatory = const $CopyWithPlaceholder(),
  }) {
    return E03R00002State(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      filePickerResult: filePickerResult == const $CopyWithPlaceholder()
          ? _value.filePickerResult
          // ignore: cast_nullable_to_non_nullable
          : filePickerResult as FilePickerResult?,
      pdfFileModels: pdfFileModels == const $CopyWithPlaceholder()
          ? _value.pdfFileModels
          // ignore: cast_nullable_to_non_nullable
          : pdfFileModels as List<PdfFileModel>?,
      createdAt: createdAt == const $CopyWithPlaceholder()
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as String?,
      profileType: profileType == const $CopyWithPlaceholder()
          ? _value.profileType
          // ignore: cast_nullable_to_non_nullable
          : profileType as String?,
      signatory: signatory == const $CopyWithPlaceholder()
          ? _value.signatory
          // ignore: cast_nullable_to_non_nullable
          : signatory as String?,
    );
  }
}

extension $E03R00002StateCopyWith on E03R00002State {
  /// Returns a callable class that can be used as follows: `instanceOfE03R00002State.copyWith(...)` or like so:`instanceOfE03R00002State.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$E03R00002StateCWProxy get copyWith => _$E03R00002StateCWProxyImpl(this);
}
