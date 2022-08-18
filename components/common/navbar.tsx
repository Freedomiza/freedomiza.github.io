import React from "react";

import { Box, Center, Flex, Text, Link, HStack } from "@chakra-ui/react";
import NLink from "next/link";
import Routes from "constants/routes";

interface NavbarProps {
  children?: React.ReactNode;
}

export default function Navbar({ children }: NavbarProps) {
  return (
    <Box
      w="100%"
      h={64}
      p={4}
      color="white"
      bgColor="#171D26"
      as="nav"
      style={{
        position: "sticky",
        top: 0,
      }}
      zIndex={99}
    >
      <HStack h="100%">
        <Box p="1rem">
          <Link as={NLink} href={Routes.home} fontSize="md">
            About me
          </Link>
        </Box>

        <Box p="1rem">
          <Link as={NLink} href={Routes.contact} fontSize="md">
            My contact
          </Link>
        </Box>
      </HStack>
      {children}
    </Box>
  );
}
