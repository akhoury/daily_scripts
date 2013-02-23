// logs in your no-ip.com free account and refreshs the only host on there. 
// No-ip.com deletes your domain host if you don't do that every three months 
// or if your ip does not change.
// IMPORTANT - you will need to install PhantomJs and Casper JS
// IMPORTANT - COULD BREAK ANY DAY! I would use it and email if breaks or something
// usage: casperjs refreshHost.js your_no-ip_com_email@fake.com password
// THIS WILL ONLY WORK IF YOU HAVE ONLY 1 HOST (based on no-ip current policy, you can only have one on a free plan)
// YOu will need to tweak it to handle more hosts - or contact me 

var casper = require("casper").create(), email, password;

console.log('email: ' + casper.cli.get(0) + ' --  today is: ' + new Date());
email = casper.cli.get(0);
password = casper.cli.get(1);

casper.start('https://www.noip.com/login/');
casper.thenEvaluate(function(login) {
    document.querySelector('#cl1-inp').setAttribute('value', login.email);
    document.querySelector('#cl2-inp').setAttribute('value', login.pass);
    document.querySelector('form[id="clogs"]').submit();
			}, {'email': email , 'pass': password}).waitForText("Last Login:", function() {
		  	console.log('login form submitted, new location is ' + this.getCurrentUrl());
			},
			function(){
				console.log('Timed out at login form, no text found');
				casper.exit();
			}, 10000);
casper.then(function() {
    this.open('https://www.noip.com/members/dns').waitForText("Hosts By Domain", function() {
	  	console.log('Manage Hosts clicked, new location is ' + this.getCurrentUrl());
		},
			function(){
				console.log('Timed out at Manage Hosts page load, no text found');
				casper.exit();
			}, 10000);
});
casper.then(function() {
  this.clickLabel('Modify', 'a');
	this.waitForText("Hostname Information", function() { 
		console.log('Modify clicked, new location is ' + this.getCurrentUrl()); 
		},
		function(){
			console.log('Timed out at Modify click form, no text found');
			casper.exit();
		}, 10000);
});
casper.then(function() {
	casper.thenEvaluate(function() {
	    document.querySelector('form[method="POST"]').submit();
				}).waitForText("updated", function() {
			  	console.log('Update form submitted, new location is ' + this.getCurrentUrl());
			},
			function(){
				console.log('Timed out at Update Host form, no text found');
				casper.exit();
			}, 10000);	
});
casper.then(function() {
    console.log('clicked ok, new location is ' + this.getCurrentUrl());
    if (this.exists('.successbox')) {
        this.echo('found .successbox, host updated', 'INFO');
    } else {
        this.echo('.successbox not found, Host not updated', 'ERROR');
				casper.exit();
    }
});
casper.run();