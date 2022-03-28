abstract class DataMapper<I, O> {
  O call(I data);
}

abstract class BidirectionalMapper<I, O> {
  O to(I data);
  I from(O data);
}
