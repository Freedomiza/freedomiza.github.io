import React from "react";
import { Flex, Box, Container } from "@chakra-ui/react";
import { motion, useScroll, useTransform } from "framer-motion";
import AnimatedBackground from "components/3d-background/3d-background";
import MySkill from "components/my-skills";
import MyProjects from "components/my-projects";

/**
 * Aesthetic: Cyber-Fluid Dual-Path
 * DFII Score: 14
 * Differentiation: Asymmetrical scroll speeds creating a layered visual depth
 */

const DualColumnLayout: React.FC = () => {
  const { scrollYProgress } = useScroll();

  // Skill column scrolls significantly slower (0.4x)
  // We apply a positive Y to make it move "down" relative to the scrolled container
  const skillY = useTransform(scrollYProgress, [0, 1], ["0px", "600px"]);

  // Work column scrolls faster or at regular speed
  // We can even make it move up faster for more contrast
  const workY = useTransform(scrollYProgress, [0, 1], ["0px", "-200px"]);

  return (
    <Box
      position="relative"
      w="full"
      minH="300vh" // Give enough room for scrolling
      bg="#1a202c"
      overflowX="hidden"
    >
      <AnimatedBackground />

      <Container maxW="container.xl" p={0}>
        <Flex
          direction={{ base: "column", lg: "row" }}
          gap={12}
          p={{ base: 4, md: 12 }}
          align="flex-start"
        >
          {/* Skills Column - The 'Steady' Path */}
          <Box flex={1} w="full" position="relative" zIndex={2}>
            <motion.div style={{ y: skillY }}>
              <Box
                p={4}
                borderRadius="2xl"
                bg="rgba(255, 255, 255, 0.02)"
                backdropFilter="blur(5px)"
                border="1px solid rgba(255, 255, 255, 0.05)"
                boxShadow="xl"
              >
                <MySkill />
              </Box>
            </motion.div>
          </Box>

          {/* Projects Column - The 'Fast' Path */}
          <Box flex={1.4} w="full" position="relative" zIndex={1}>
            <motion.div style={{ y: workY }}>
              <Box w="full">
                <MyProjects />
              </Box>
            </motion.div>
          </Box>
        </Flex>
      </Container>

      {/* Visual differentiation: Subtle grain overlay */}
      <Box
        position="fixed"
        top={0}
        left={0}
        right={0}
        bottom={0}
        pointerEvents="none"
        opacity={0.03}
        zIndex={10}
        bgImage="url('https://grainy-gradients.vercel.app/noise.svg')"
      />
    </Box>
  );
};

export default DualColumnLayout;
