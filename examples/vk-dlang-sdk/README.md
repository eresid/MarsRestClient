##D SDK for VK API

D library for VK API interaction, includes OAuth 2.0 authorization and API methods. Full VK API features documentation can be found [here](http://vk.com/dev).

This library has been created using the VK API JSON Schema. It can be found [here](https://github.com/VKCOM/vk-api-schema). It uses VK API [version](https://vk.com/dev/versions) 5.53.

##1. Prerequisites

* [DUB](https://code.dlang.org/getting_started) 1.0 or later
* [DMD](https://dlang.org/) 2.071.2 or later
* [Vibe.d](http://vibed.org/) 0.7.29 or later

##2. Prepare for using

Create a new VK application [here](https://vk.com/editapp?act=create) to use VK D SDK. Please choose an application type depending on which authorization pattern you need. It should be "Standalone" for Direct Authorization, "Web site" for Authorization Code Flow for  server side  requests and any of them for Client Credentials Flow. 

Fill in the title, confirm the action via SMS and you will be redirected to the application settings page. 

You will need your application ID (referenced as API_ID in the documentation), secure key (CLIENT_SECRET) and authorized redirect URI (REDIRECT_URI).
