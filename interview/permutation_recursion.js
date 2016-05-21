var a = [
  [0, 1, 2],
  [3, 4, 5]
];

// var b = [
// ];

// possible solution:
// a, e, i
// a, e, j
// ...
// c, g, l
/*
 * @param matrix - multi-dimensional array
 */
function perm(matrix) {
  var N = matrix.length;
  if (N === 0) {
    console.log('');
    return;
  }

  // if there is only one lock
  if (N === 1) {
    for (var i = 0; i < matrix.length; i++) {
      console.log(matrix[i]);
    }
  } else {

    console.log(matrix[0]);

  }

  return;
}

