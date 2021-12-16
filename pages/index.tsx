import Link from "next/link";
import { Box, Center, Heading, Text, VStack } from "@chakra-ui/react";

import Layout from "components/common/layouts";

export default function Home() {
  return (
    <>
      <Box
        p={4}
        minH={200}
        color="white"
        alignContent="center"
        justifyContent="center"
        bgGradient="linear(to-r, green.200, pink.500)"
      >
        <Center h={"50vh"} minHeight="xl">
          <VStack>
            <Heading size={"2xl"}>I'm Khoa Le</Heading>
            <Box p="2"></Box>
            <Text size="md" color="black" maxW={"50vw"} align="center">
              I'm a fronted developer, creating awesome websites and mobile apps{" "}
              <br />
              for clients of all sizes around the globe.
            </Text>
            <Box p="2"></Box>

            <Text size="md" color="black" maxW={"50vw"}>
              Start scrolling and learn more about me.
            </Text>
          </VStack>
        </Center>
      </Box>
    </>
  );
}

Home.getLayout = function getLayout(page) {
  return <Layout>{page}</Layout>;
};
