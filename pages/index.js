import Link from "next/link";

import {
  ChakraProvider,
  extendTheme,
  Box,
  AspectRatio,
  Center,
} from "@chakra-ui/react";

// 2. Extend the theme to include custom colors, fonts, etc
const colors = {
  brand: {
    900: "#1a365d",
    800: "#153e75",
    700: "#2a69ac",
  },
};
const theme = extendTheme({ colors });

export default function Home() {
  return (
    <ChakraProvider theme={theme}>
      <Box
        w="100vw"
        p={4}
        minH={200}
        color="white"
        alignContent="center"
        justifyContent="center"
        bgGradient="linear(to-r, green.200, pink.500)"
      >
        <Center bg="tomato" h="200px">
          Hello World.{" "}
          <Link href="/about" as={process.env.BACKEND_URL + "/about"}>
            <a>About</a>
          </Link>
        </Center>
      </Box>
    </ChakraProvider>
  );
}
