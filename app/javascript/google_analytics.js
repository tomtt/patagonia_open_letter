function register_gtag() {
  let googleId = document.querySelector("meta[name='google-analytics-id']").content;
  if (googleId) {
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', googleId);
  }
}

document.addEventListener("DOMContentLoaded", (event) => {
  register_gtag();
});
