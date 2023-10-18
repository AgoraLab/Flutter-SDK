// Share the iris web url to all the tests

// This url should be same as the url inside the `example/web/index.html`
const irisWebUrl = 'https://download.agora.io/staging/iris-web-rtc_0.1.2-dev.1.js';
const irisWebFakeUrl = 'https://download.agora.io/staging/iris-web-rtc-fake_0.1.2-dev.1.js';

var scriptLoaded = false;
function loadIrisWeb() {
  function _appendScript(url) {
    var scriptTag = document.createElement('script');
    scriptTag.src = url;
    scriptTag.type = 'application/javascript';
    document.body.append(scriptTag);
  }

  if (scriptLoaded) {
    return;
  }
  scriptLoaded = true;

  _appendScript(irisWebUrl);
  _appendScript(irisWebFakeUrl);
}

loadIrisWeb();