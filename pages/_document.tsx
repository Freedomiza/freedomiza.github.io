import { Html, Head, Main, NextScript } from "next/document";
import Script from "next/script";

export default function Document() {
  return (
    <Html>
      <Head />
      <body>
        <Main />
        <NextScript />
        <Script
          src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r126/three.min.js"
          strategy="beforeInteractive"
        ></Script>
        <Script
          src="https://unpkg.com/three@0.126.0/examples/js/loaders/GLTFLoader.js"
          strategy="beforeInteractive"
        ></Script>
        <Script
          src="https://unpkg.com/three@0.126.0/examples/js/controls/OrbitControls.js"
          strategy="beforeInteractive"
        ></Script>
      </body>
    </Html>
  );
}
