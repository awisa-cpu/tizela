//defined contract for shorlets, boat cruise and car rental
abstract interface class FirebaseCloudDataRepository {
  Future<void> createNewData<D>({required D data});

  Future<T> findDataById<T>({required String id});

  Future<List<T>> fetchAllData<T>();

  Stream<List<T>> fetchAllDataAsStream<T>();

  Future<void> editData<T>({required T data});

  Future<void> editSpecificDetails({
    required String id,
    required Map<String, dynamic> data,
  });
}
