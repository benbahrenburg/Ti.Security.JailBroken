
var mod = require('Ti.Security.JailBroken');
var exampleText = mod.isJailBroken();

// open a single window
var win = Ti.UI.createWindow({
    backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
label.text = exampleText ? "Is jailbroken" : "Not jailbroken";

win.open();
