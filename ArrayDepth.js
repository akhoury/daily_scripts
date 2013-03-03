var arr = [12,3,[1,2,3,[34,54]]];
console.log(arr);
function findDepth(a){
  var c = 0;
  for (v in a){
    if(Array.isArray(v)){
      console.log(v + ' is an array');
      c = findDepth(v) + 1;
    }
  }
  return c;
}
console.log(findDepth(arr));
