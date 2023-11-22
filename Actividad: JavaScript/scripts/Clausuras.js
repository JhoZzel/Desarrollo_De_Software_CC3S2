function f1(x) {
  var bar = 3;
  return function (y) {
    console.log(x + y + (bar++));
    }
}
var bar = f1(5);
bar(11);
