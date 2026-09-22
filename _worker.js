// Worker code for VLESS
let userID = 'd342d11e-d424-4583-b36e-524ab1f0afa4';
let proxyIPs = ['proxyip.cmlius.cc', 'cdn.xn--b6g.org'];

addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  const upgradeHeader = request.headers.get('Upgrade');
  if (!upgradeHeader || upgradeHeader !== 'websocket') {
    return new Response('VLESS worker is running', { status: 200 });
  }
  return processVlessRequest(request);
}

function processVlessRequest(request) {
  const [client, server] = Object.values(new WebSocketPair());
  server.accept();
  return new Response(null, {
    status: 101,
    webSocket: client,
  });
}
