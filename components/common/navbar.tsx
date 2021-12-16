import React from "react";

import { Box, Center, Flex, Text, Link } from "@chakra-ui/react";
import NLink from "next/link";
import Routes from "constants/routes";

interface NavbarProps {
  children?: React.ReactNode;
}

export default function Navbar({ children }: NavbarProps) {
  return (
    <Box w="100%" h={64} p={4} color="white" as="nav" textColor="CaptionText">
      <Center h="100%">
        <Box p="1rem" as={Link}>
          <Link as={NLink} href={Routes.home} fontSize="md">
            About me
          </Link>
        </Box>

        <Box p="1rem" as={Link}>
          <Link as={NLink} href={Routes.mySkill} fontSize="md">
            My skills
          </Link>
        </Box>

        <Box p="1rem" as={Link}>
          <Link as={NLink} href={Routes.myWork} fontSize="md">
            My works
          </Link>
        </Box>
      </Center>
      {children}
    </Box>
  );
}
