// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$friendDatabaseHash() => r'e86f381e0e657dd4b217ea61a13ab1ff5e2a2987';

/// See also [friendDatabase].
@ProviderFor(friendDatabase)
final friendDatabaseProvider = AutoDisposeProvider<FriendsDatabase>.internal(
  friendDatabase,
  name: r'friendDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$friendDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FriendDatabaseRef = AutoDisposeProviderRef<FriendsDatabase>;
String _$friendsHash() => r'82b7a15ac4beb936b40e706c9d74423893e2db92';

/// See also [friends].
@ProviderFor(friends)
final friendsProvider = AutoDisposeStreamProvider<List<Friend>>.internal(
  friends,
  name: r'friendsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$friendsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FriendsRef = AutoDisposeStreamProviderRef<List<Friend>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
