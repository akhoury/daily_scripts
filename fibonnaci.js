function fib(n){
	if (n <= 1){
	return n;
	} 
	return fib(n-1)+fib(n-2);
}
function rFibonnaci(n){
	for(i=1; i<=n; i++){
	console.log(i+": " + fib(i));
	}
}
function iFibonnaci(n){
	if (n === 0){return 0;}
	var fib = 0; 
	var g = 1;
	for(i=1; i<=n; i++){
		fib = fib + g;
		g = fib - g;
		console.log("fib: " + fib);
	}
	return "done";
}