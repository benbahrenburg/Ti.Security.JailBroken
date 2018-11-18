# Ti.Security.JailBroken

Ti.Security.JailBroken allows you to determine if the iOS device your app is running upon is jailbroken or not.

This is only for iOS.

## Before you start
* You need Titanium 7.4.0.GA or greater.
* This module has only been tested on iOS11+

## Setup

* You must be running iOS 11 or greater
* You must be using Ti SDK 7.4.0.GA or greater
* Compiled modulle available at [dist folder](https://github.com/benbahrenburg/Ti.Security.JailBroken/tree/master/ios/dist) 
* Install the TTi.Security.JailBroken module. If you need help here is a "How To" [guide](https://wiki.appcelerator.org/display/guides/Configuring+Apps+to+Use+Modules). 
* You can now use the module via the commonJS require method, example shown below.

<pre><code>
//Add the core module into your project
var mod = require('Ti.Security.JailBroken');

</code></pre>

Now we have the module installed and avoid in our project we can start to use the components, see the feature guide below for details.

## Methods

The module contains only four methods. The goal is to keep the function of this module narrow.

#### isJailBroken

Indicates if the device is jailbroken

Method returns true or false

<b>Example</b>
~~~
var mod = require('Ti.Security.JailBroken');
var broken = visits.isJailBroken();
console.log("Device is jail broken " + (broken)? "Yes" : "No");
~~~

## Licensing

This project is licensed under the OSI approved Apache Public License (version 2). For details please see the license associated with each project.

Developed by [Ben Bahrenburg](http://bahrenburgs.com) available on twitter [@bencoding](http://twitter.com/bencoding)

## Learn More

### Twitter

Please consider following the [@bencoding Twitter](http://www.twitter.com/bencoding) for updates and more about Titanium.

### Blog

For module updates, Titanium tutorials and more please check out my blog at [bencoding.com](http://bencoding.com). 
