class LinhVucModels {
  final int id;
  final String name;
  final bool trangThai;

  LinhVucModels({required this.id, required this.name, required this.trangThai});

  @override
  String toString() {
    return 'LinhVucModels(id:$id,name:$name,trangThai:$trangThai)';
  }
}
