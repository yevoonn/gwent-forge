const IN_APP_PATTERN =
  /FBAN|FBAV|FB_IAB|FBIOS|Instagram|Messenger|Line\/|MicroMessenger|Snapchat|TikTok|musical_ly/i;

export function isInAppBrowser() {
  return IN_APP_PATTERN.test(navigator.userAgent);
}

export function isAndroid() {
  return /Android/i.test(navigator.userAgent);
}

// Android: intent:// opens a link in Chrome. There is no reliable equivalent on iOS.
export function getChromeIntentUrl() {
  const { host, pathname, search, hash } = window.location;

  return `intent://${host}${pathname}${search}${hash}#Intent;scheme=https;package=com.android.chrome;end`;
}
