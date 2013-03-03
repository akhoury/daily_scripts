var r1 = new RegExp(/[^,]+/g), 
    r2 = new RegExp(/(>?[^,\n\r]+)/g), 
    i=0,j=25,s1,s2,a1,a2,a3,a4,t1,t2,t3,t4,t5;
    s1 = "a,b,c,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z\r\n",
    s2 = ",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,"; //a";
a1 = s1.match(r1); a2 = s1.match(r2); a3 = s2.match(r1); a4 = s2.match(r2);
console.log('initial matches:\ns1:r1 matched length:'+a1.length+'-> ['+a1+'] ' 
            +'\ns1:r2 matched length:'+a2.length+'-> ['+a2+']');
console.log('initial matches:\ns2:r1 matched length:'+(a4 ? a4.length : 0)+'-> ['+a3+'] ' 
            +'\ns2:r2 matched length:'+(a4 ? a4.length : 0)+'-> ['+a4+']');
console.log('s1.length:\ts2.length:\tr1>s1(ms)\tr2>s1(ms)\tr1>s2(ms)\tr2>s2(ms)');
for(;i<j;i++){
    s1 += ','+s1+'\r\n';
    //s2 = s2.substring(0, s2.length-1);
    s2 += ','+s2+'\n\r';//'a\n\r';
    t1 = Date.now();
    s1.match(r1);
    t2 = Date.now();
    s2.match(r1);
    t3 = Date.now();
    s1.match(r2)
    t4 = Date.now();
    s2.match(r2);
    t5 = Date.now();
    console.log(s1.length+'\t\t'+s2.length+'\t\t'+(t2-t1)+'\t\t'+(t3-t2)+'\t\t'+(t4-t3)+'\t\t'+(t5-t4));
}