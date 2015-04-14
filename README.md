Example
=======
An example plugin for Happening.

About happening
---------------
In case you don't know what this is about: Happening is a group app for iOS and Android, that allows you to create your own plugins in minutes. To get started signup at: https://develop.happening.im

Don't worry: plugins (also called Group Apps) are just Javascript (or CoffeeScript), both client-side and server-side. However, the powerful Happening environment provides you with user group details, a database that syncs to all clients, reactive user-interface widgets, and html/css for whatever else you may want to do. That social app you've wanted to build for ages, but didn't because it'd take you weeks? You'll finish it tonight.

Getting started
---------------
On Linux/Mac, use your Bash-compatible shell. On Windows, we recommend git console that comes with [git](http://git-scm.com/download/win).

1. Clone the example code: `git clone https://github.com/happening/Example.git`.

2. Navigate to https://happening.im/dev. This will redirect you to the special "My group apps" happening, possibly after logging in.

3. Tapping the console icon next to your plugin will open its development console. Copy the plugin's __upload code__ to a file: `echo 1234567890 > .deploykey`.

4. Deploy your plugin using `./deploy`. It should instantaneously update in your browser.

Manifest
--------
`manifest` holds your app configuration. Supported keys:

- __name__ Name of your plugin.
- __desciption__ Description of your plugin.
- __api__ API version, don't use anything other than `2`

Distribution
------------
On the development console, you will find a __share code__ besides the upload code. By searching for this code in the Group App store in other happenings, you can add your custom plugin (making it instantaneously available to all its members!).

Once added, the plugin will be upgraded within 60 minutes of you updating the plugin in "My group apps". `exports.onUpgrade` will be called, use this to update the data store. You can view your plugin's log and database for these other Happenings on the development console. Use this to debug problems with these instances.

If you feel your Group App should be placed in the Group App store, let us know.
