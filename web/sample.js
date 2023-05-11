function addNumbers(a, b, callback,callback2) {
  var resultPlus = a + b;
  callback(resultPlus);
  var resultMultiple = a * b;
  callback2(resultMultiple);
}