'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "b34e34eba9fd6cfce5d80667ce85add4",
"assets/FontManifest.json": "d1fd2023e48fdf2d36757c6e6917c671",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/fonts/saveEarth2.ttf": "47a69df010ec81bd9bb2afa95605dbe1",
"assets/LICENSE": "2b8532892416b573c32dabe0049248c4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/rive/arrow.flr": "6a94d71fc63f1a2a49c5356578519cc2",
"assets/rive/world_spin.flr": "cda52fbd9dd58796198f8c1d781dfec1",
"ethm.png": "fcc595903124a3360dc57662623a5833",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "249790641c8ef177b6ceda06b5a7c77e",
"/": "249790641c8ef177b6ceda06b5a7c77e",
"main.dart.js": "ae924efe500595f0559aa68077ffa953",
"manifest.json": "b409c7f06be31c97b95e4ab59b878d42"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
