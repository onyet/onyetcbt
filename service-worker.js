self.skipWaiting();

self.addEventListener('install', event => {
    console.log('Service worker installing...');
    // Add a call to skipWaiting here
});

self.addEventListener('activate', event => {
    console.log('Service worker activating...');
});