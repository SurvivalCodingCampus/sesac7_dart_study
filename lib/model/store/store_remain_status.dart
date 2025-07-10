enum StoreRemainStatus {
  plenty,
  some,
  few,
  breaked,
  empty,
  unknown;

  @override
  String toString() {
    return switch (this) {
      StoreRemainStatus.plenty => 'plenty',
      StoreRemainStatus.some => 'some',
      StoreRemainStatus.few => 'few',
      StoreRemainStatus.breaked => 'break',
      StoreRemainStatus.empty => 'empty',
      StoreRemainStatus.unknown => '',
    };
  }
}
