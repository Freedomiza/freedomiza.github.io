import Head from "next/head";

import Layout from "components/common/layouts";

import React from "react";

import AboutMe from "components/about-me";
import MySkill from "components/my-skill";
import Script from "next/script";
export default function Home() {
  return (
    <>
      <Head>
        <title>{"Khoa Le 's CV"}</title>
        <meta name="viewport" content="initial-scale=1.0, width=device-width" />
      </Head>
      <Script
        src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r121/three.min.js"
        strategy="beforeInteractive"
      ></Script>

      <AboutMe />
      <MySkill />
    </>
  );
}

Home.getLayout = function getLayout(page) {
  return <Layout>{page}</Layout>;
};
