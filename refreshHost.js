// logs in your no-ip.com free account and refreshs the only host on there. 
// No-ip.com deletes your domain host if you don't do that every three months 
// or if your ip does not change.
// IMPORTANT - you will need to install PhantomJs and Casper JS
// IMPORTANT - COULD BREAK ANY DAY! I would use it and email if breaks or something
// usage: casperjs refreshHost.js your_no-ip_com_email@fake.com password


var casper = require("casper").create(), email, password;

console.log('email: ' + casper.cli.get(0));
email = casper.cli.get(0);
password = casper.cli.get(1);

casper.start('https://www.noip.com/login/');
casper.thenEvaluate(function(login) {
    document.querySelector('#cl1-inp').setAttribute('value', login.email);
    document.querySelector('#cl2-inp').setAttribute('value', login.pass);
    document.querySelector('form[id="clogs"]').submit();
			}, {'email': email , 'pass': password}).waitForText("Last Login:", function() {
		  	console.log('login form submitted, new location is ' + this.getCurrentUrl());
			});
casper.then(function() {
    this.open('https://www.noip.com/members/dns').waitForText("Hosts By Domain", function() {
	  	console.log('Manage Hosts clicked, new location is ' + this.getCurrentUrl());
		});
});
casper.then(function() {
  this.clickLabel('Modify', 'a');
	this.waitForText("Hostname Information", function() { 
		console.log('Modify clicked, new location is ' + this.getCurrentUrl()); 
		});
});
casper.then(function() {
	casper.thenEvaluate(function() {
	    document.querySelector('form[method="POST"]').submit();
				}).waitForText("updated", function() {
			  	console.log('Update form submitted, new location is ' + this.getCurrentUrl());
			});	
});
casper.then(function() {
    console.log('clicked ok, new location is ' + this.getCurrentUrl());
    if (this.exists('.successbox')) {
        this.echo('found .successbox, host updated', 'INFO');
    } else {
        this.echo('.successbox not found, Host not updated', 'ERROR');
    }
});
casper.run();