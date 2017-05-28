function foo(a, callback) {
  a = "foo";
  console.log(a);
  return callback(a);
  console.log("unreachable");
}

function bar(a, callback) {
  a = "bar";
  console.log(a);
  callback(a);
  console.log("reachable");
}


function main() {
  var a = "main_1";
  console.log(a);
  foo(a, function(b) {
    console.log(a + " " + b)
  });
  console.log("bye_1");

  console.log("");

  a = "main_2";
  console.log(a);
  bar(a, function(b) {
    console.log(a + " " + b)
  });
  console.log("bye_2");
}

main();
