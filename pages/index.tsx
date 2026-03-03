import Head from "next/head";

import Layout from "components/common/layouts";

import React from "react";

import AboutMe from "components/about-me";
import MySkill from "components/my-skills";
import MyProjects from "components/my-projects";

import { Parallax, ParallaxLayer } from "@react-spring/parallax";
import AnimatedBackground from "components/3d-background/3d-background";
import WorkspaceDiorama from "components/3d-workspace";
import RocketBackground from "components/3d-rocket-background";
import { Box, Image, useBreakpointValue } from "@chakra-ui/react";

// Differentiation Anchor: Floating Tech Icons in mid-layer
const FloatingDecor = () => (
  <>
    <ParallaxLayer
      offset={0.2}
      speed={-0.1}
      style={{ opacity: 0.1, pointerEvents: "none" }}
    >
      <Box position="absolute" right="10%" top="10%">
        <Image src="/images/js-icon.svg" width="100px" alt="" />
      </Box>
    </ParallaxLayer>
    <ParallaxLayer
      offset={0.6}
      speed={0.4}
      style={{ opacity: 0.1, pointerEvents: "none" }}
    >
      <Box position="absolute" left="5%" top="20%">
        <Image src="/images/react-icon.svg" width="150px" alt="" />
      </Box>
    </ParallaxLayer>
    <ParallaxLayer
      offset={1.2}
      speed={0.2}
      style={{ opacity: 0.1, pointerEvents: "none" }}
    >
      <Box position="absolute" right="5%" top="40%">
        <Image src="/images/flutter_logo.svg" width="120px" alt="" />
      </Box>
    </ParallaxLayer>
  </>
);

export default function Home() {
  const isDesktop = useBreakpointValue({ base: false, lg: true });
  const totalPages = isDesktop ? 2 : 7;

  return (
    <>
      <Head>
        <title>{"Khoa Le 's CV"}</title>
        <meta name="viewport" content="initial-scale=1.0, width=device-width" />
      </Head>

      <Parallax pages={totalPages} style={{ backgroundColor: "#1a202c" }}>
        {/* Layer 0: Global Background (Vanta) - Deepest layer */}
        <ParallaxLayer offset={0} speed={0} factor={totalPages}>
          <AnimatedBackground />
        </ParallaxLayer>

        {/* Second Background: 3D Workspace Diorama */}
        <ParallaxLayer
          offset={1}
          speed={0.1}
          factor={isDesktop ? 1 : 6}
          style={{ zIndex: 0, opacity: 0.8 }}
        >
          <WorkspaceDiorama />
        </ParallaxLayer>

        {/* Third Background: Rocket Animation */}
        <ParallaxLayer
          offset={isDesktop ? 2 : 4} // Moved lower than the workspace
          speed={0.4}
          factor={isDesktop ? 1.5 : 2}
          style={{ zIndex: 0, opacity: 0.6 }}
        >
          <RocketBackground />
        </ParallaxLayer>

        {/* 
          Layer 1: Differentiation Anchor (Floating Icons) - Middle depth 
          Contents only rendered on Desktop to avoid mobile clutter and parallax mapping issues
        */}
        <ParallaxLayer
          offset={0.2}
          speed={-0.1}
          style={{ opacity: isDesktop ? 0.1 : 0, pointerEvents: "none" }}
        >
          {isDesktop && (
            <Box position="absolute" right="10%" top="10%">
              <Image src="/images/js-icon.svg" width="100px" alt="" />
            </Box>
          )}
        </ParallaxLayer>

        <ParallaxLayer
          offset={0.6}
          speed={0.4}
          style={{ opacity: isDesktop ? 0.1 : 0, pointerEvents: "none" }}
        >
          {isDesktop && (
            <Box position="absolute" left="5%" top="20%">
              <Image src="/images/react-icon.svg" width="150px" alt="" />
            </Box>
          )}
        </ParallaxLayer>

        <ParallaxLayer
          offset={1.2}
          speed={0.2}
          style={{ opacity: isDesktop ? 0.1 : 0, pointerEvents: "none" }}
        >
          {isDesktop && (
            <Box position="absolute" right="5%" top="40%">
              <Image src="/images/flutter_logo.svg" width="120px" alt="" />
            </Box>
          )}
        </ParallaxLayer>

        {/* Layer 2: Main Content - Foreground layer */}
        <ParallaxLayer offset={0} speed={isDesktop ? 0.5 : 0.2}>
          <AboutMe />
        </ParallaxLayer>

        {/* 
          Dual Path Section: Skills and Work 
          On Desktop: Columnar and Asymmetrical
          On Mobile: Sequential
        */}

        {/* Skills Path */}
        <ParallaxLayer
          offset={isDesktop ? 1 : 1.0}
          speed={isDesktop ? 0.05 : 0.2}
          factor={isDesktop ? 3 : 1}
          style={{
            display: "flex",
            justifyContent: "center",
            alignItems: isDesktop ? "flex-start" : "center",
            width: isDesktop ? "40%" : "100%",
            zIndex: 3,
            pointerEvents: "none",
          }}
        >
          <Box
            w="full"
            px={isDesktop ? 8 : 4}
            pt={isDesktop ? "15vh" : "5vh"}
            pointerEvents="auto"
          >
            <MySkill />
          </Box>
        </ParallaxLayer>

        {/* Work Path */}
        <ParallaxLayer
          offset={isDesktop ? 1 : 2.0}
          speed={isDesktop ? 0.4 : 0.3}
          factor={isDesktop ? 3 : 5}
          style={{
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            width: isDesktop ? "60%" : "100%",
            left: isDesktop ? "40%" : "0",
            color: "white",
            zIndex: 2,
          }}
        >
          <Box w="full" px={isDesktop ? 12 : 4} pt={isDesktop ? 0 : "5vh"}>
            <MyProjects />
          </Box>
        </ParallaxLayer>
      </Parallax>
    </>
  );
}

Home.getLayout = function getLayout(page) {
  return <Layout>{page}</Layout>;
};
