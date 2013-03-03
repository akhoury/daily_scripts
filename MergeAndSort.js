var arr1 = [12, null, 2, 7, null, 4, 15, 1, null, null, 19, 20, null];
var arr2 = [28, 5, 2, 9, 3];
console.log('arr1: ' + arr1 + ' | arr2: ' + arr2);
function merge(a1, a2){
  var i = 0, j = 0;
  for (i; i < a1.length; i++){
    if(a1[i] === null && j < a2.length && a2[j] !== null){
      a1[i] = a2[j];
      j++;
    }
  }
  return a1.sort(function(a,b){return a-b});   
}
console.log(merge(arr1, arr2));


