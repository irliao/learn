var A1 = [
  ['a', 'b', 'c', 'd'],
  ['e', 'f', 'g', 'h'],
  ['i', 'j', 'k', 'l']
];

// possible solution:
// a, e, i
// a, e, j
// ...
// c, g, l
/*
 * @param A - multi-dimensional array
 */
(function (A) {
  var N = A.length;
  var ret = [];
  for (var i = 0; i < N; i++) {
    var K = A[i].length;
    for (var j = 0; j < K; j++) {
      var elem = A[i][j];
      var counter = 0;
      var maxPerm = Math.pow(K, (j - 1));
      while (counter++ < maxPerm) {
        var index = i + counter;
        ret[index] = !ret[index] ? '' : ret[index];
        ret[index] += (ret[index] + elem);
      }
    }

    console.log(ret.toString());
  }
})(A1);

