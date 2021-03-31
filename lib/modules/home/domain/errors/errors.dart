abstract class FailureList implements Exception {}

class DataSourceError implements FailureList {}

class DataBaseError implements FailureList {}
