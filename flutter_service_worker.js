'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "c085f9acd3be1296f727b0ea4e7dda0d",
".git/config": "920a11de313bfb8d93d81f4a3a5b71b6",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ecbb0cb5ffb7d773cd5b2407b210cc3b",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "e4db8c12ee125a8a085907b757359ef0",
".git/hooks/pre-push.sample": "3c5989301dd4b949dfa1f43738a22819",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/update.sample": "517f14b9239689dff8bda3022ebd9004",
".git/index": "36722c2000a42543f52e7bc82b1aa8b3",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "58f0b4efa5329c482e3083c32b62b125",
".git/logs/refs/heads/master": "58f0b4efa5329c482e3083c32b62b125",
".git/logs/refs/remotes/freedomiza.github.io.git/master": "0a1eb529f04c5d354fdd148f21bfe79e",
".git/objects/04/5b713ef00beb1cc7fb6143be49a4d72dfe674f": "c4c69b42629e1fb99be699920c148956",
".git/objects/0f/816fb5068fb5d0dc1623718a94d7a34c5edfe4": "48392ce692d6328aef69a753fa305233",
".git/objects/13/cd698afa86edb334bec59991cd113491a5a4f1": "01d69635e49925db17e7c32e26fc974f",
".git/objects/15/9b15011009e1e691b0761e5627dc3f3aa452ad": "822c0ced8e90203ed87ff7e0082d7945",
".git/objects/20/5bb5db271c6d8de8399864c7bb9b917f638893": "c993b22f115d7f3ae6d5b7b212806539",
".git/objects/21/144b7be9c2e7d613968e8e4d08ba76fa6e4c82": "837f8f99daded594c1dc104e7428e70e",
".git/objects/24/91a95cb8052ba2766fa26682fa4b0045dfcf60": "3999645c02f47ad998e10888fb4acc87",
".git/objects/2e/7bf8bf6550b16f82d0a8c70a7929f33e2915db": "d7d49846270cc200758958fd387f23cc",
".git/objects/2e/c1cd8073b3c675942139521711c60050b35402": "db8f06c4de30028b502cf3aafad7dc71",
".git/objects/32/c4d084c96a33344aead5dde4d202becdbaae9a": "165bd7d28a634a6f016d23eff168a855",
".git/objects/37/6f88d72a52905d9b976e5d4d87ddbfc72f4bcc": "e4af0c9b81e703949f13f7a66a33b0c7",
".git/objects/50/4a45454d3593d4ae6b918faa8b7dc440ebc950": "a62e50a638295457539c98c4859c7668",
".git/objects/68/c3e69c89a116adac5035b7bad08ef8f693c134": "b032ce762882fb977525314e048dd7df",
".git/objects/80/004b37de44ff5a1bb08604d9f58d2a00fa8bd6": "03eace0a0426b964e751f5f2f9d2859a",
".git/objects/81/0337fcab9374ea7916511a5b9b59c1fe38c5fd": "cc99e87ef5a5ad26f76eb93e555d98fa",
".git/objects/86/26d808365b4b3203931a069982270d280fef52": "3718a6fb55d1c98cf4c45436f39ed09c",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/9d6fd2fd9707e4e2ddfc5a724623f8a280dc1d": "cbebf860e826043b985630e2a369eb8e",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8c/2b93fea5a1f5f5b5354eac0d9986ca1ac6496b": "d2cab4c0a69eb786ee5f951131625b8b",
".git/objects/91/ebd7c1fff00ab1a1757c8fecc626d94fcf913f": "2414a022f4aad388f1a6d61bbacd4b6b",
".git/objects/92/14a98b4ae8be8c30bf1a5a5109ac1a68499a42": "d14ba473c6942f77feaf244c175749b6",
".git/objects/95/19e1d75e8e60fc461d42dceff7162076484747": "87166efde232eca9c4f1ad4118b6d046",
".git/objects/a4/c8fdfd35ae378d303f1c5eb132fa9af82d13ae": "eebf89078d3532039245389518c1c257",
".git/objects/a7/ad4d986b7edac54e80d4a4ba3187b13f83e07e": "14257346e115a9f75767ab5f344d726d",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b8/a2a1158110a9ed0374c391492b0eef2a26d54d": "0fc591a7b94b715d4365965f3b5b015a",
".git/objects/db/d8e2783e6089b573a34566c9f7bd14236b10e9": "cd5fa74e787845bd9d9b9045f8a11898",
".git/objects/dc/2540b37419742beb06b1c61953771a69e050d3": "608fef69e10c23d3e1725f5821738990",
".git/objects/dd/56eabbf298449db91bfa8644c6fbb20b8e6dda": "3fa6bb294070401dbba0b01792b84ce0",
".git/objects/e1/bf24e206890ee050606495c61a12e954d429e4": "e61587367cb0ff461bf9208dee37d863",
".git/objects/e4/67dd461b22bf47cda8cd0f6fea749fbcd4d8bd": "b4aa03811cb7cacec531a3aa1322d825",
".git/objects/fc/565ec170b7fd55cbf422b8188a6f64eddda60e": "c1d5b622c8e63d1865785872c9d4a21d",
".git/refs/heads/master": "3900eb90e856d6380549150f65a9e968",
".git/refs/remotes/freedomiza.github.io.git/master": "3900eb90e856d6380549150f65a9e968",
".git/sourcetreeconfig.json": "526622c160309972408d2871dab47910",
"assets/AssetManifest.json": "28319ebeb3bfb607ca765df950d1e654",
"assets/assets/images/47566685.jfif": "124deec77d9788eb59fb53c8d5b821ed",
"assets/assets/images/47566685.png": "135f00c1732a7111b4bea0844b13b1b0",
"assets/assets/images/header-background.jpg": "395df93f3a2d8a841031e95505e05fa4",
"assets/assets/images/loader.gif": "b41bfcf37a8a365d2c101c9931bc0e75",
"assets/assets/images/overlay-bg.png": "9176109b8b53b0cd9be8b698b720be5e",
"assets/assets/images/overlay-zoom.png": "a7d6622a9770d821ce7244048eb81b4c",
"assets/assets/images/profilepic.jpg": "7e773edecdc38561e4d4bcd2606811f3",
"assets/assets/images/sample-image.jpg": "a6a76c7e087849f9223e1839338779e9",
"assets/assets/images/testimonials-bg.jpg": "f063209a66807e69329fada1e2590674",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/NOTICES": "d47cd2b858395d6b9f9ea3f2894c0cdd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "135f00c1732a7111b4bea0844b13b1b0",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "33a25f6cb5e1d608f1f886254239424b",
"/": "33a25f6cb5e1d608f1f886254239424b",
"main.dart.js": "7c0432f3e5df879c0a6497c2a4533026",
"manifest.json": "8971a408f7afb8c0227571709921b2f5"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/LICENSE",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      // Provide a no-cache param to ensure the latest version is downloaded.
      return cache.addAll(CORE.map((value) => new Request(value, {'cache': 'no-cache'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');

      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }

      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#')) {
    key = '/';
  }
  // If the URL is not the the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache. Ensure the resources are not cached
        // by the browser for longer than the service worker expects.
        var modifiedRequest = new Request(event.request, {'cache': 'no-cache'});
        return response || fetch(modifiedRequest).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.message == 'skipWaiting') {
    return self.skipWaiting();
  }

  if (event.message = 'downloadOffline') {
    downloadOffline();
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.add(resourceKey);
    }
  }
  return Cache.addAll(resources);
}
