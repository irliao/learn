// pseudocode direct translation
function insertionSort(A) {
  for (var j = 1; j < A.length; j++) {
    var key = A[j];
    var i = j - 1;
    while (i >= 0 && A[i] > key) {
      A[i + 1] = A[i];
      i = i - 1;
    }
    A[i + 1] = key;
  }
}

var a = [5,2,4,6,1,3];
insertionSort(a);
console.log(a);

