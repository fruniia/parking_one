abstract class Repository<T> {
  List<T>? getAll();
  T? getById(int id);
  void add(T item);
  void update(T item);
  void delete(int id);
}
