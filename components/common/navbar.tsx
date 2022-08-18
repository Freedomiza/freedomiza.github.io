import React from "react";

import {
  Box,
  Link,
  HStack,
  Flex,
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbSeparator,
} from "@chakra-ui/react";
import NLink from "next/link";
import Routes from "constants/routes";

interface NavbarProps {
  children?: React.ReactNode;
}

export default function Navbar({ children }: NavbarProps) {
  return (
    <Box
      flexDirection="row"
      // style={{
      //   position: "sticky",
      //   top: 0,
      // }}
      // zIndex={99}
    >
      <Breadcrumb h="100%">
        <BreadcrumbItem p="1rem">
          <NLink href={Routes.home} passHref>
            <BreadcrumbLink fontSize="md">About me</BreadcrumbLink>
          </NLink>
        </BreadcrumbItem>

        <BreadcrumbItem p="1rem">
          <NLink href={Routes.contact} passHref>
            <BreadcrumbLink fontSize="md">My contact</BreadcrumbLink>
          </NLink>
        </BreadcrumbItem>
      </Breadcrumb>
      {children}
    </Box>
  );
}
