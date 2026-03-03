import {
  Image,
  Box,
  Center,
  Heading,
  VStack,
  Text,
  Wrap,
  WrapItem,
  Link,
  Button,
  useBreakpointValue,
} from "@chakra-ui/react";
import NLink from "next/link";
import AnimatedBackground from "components/3d-background/3d-background";
import Routes from "constants/routes";
import profileImg from "public/images/profile.png";
import ScrollButton from "../scroll-button";
import TagSphere from "../tag-sphere";
import TypeWriter from "../type-writer";

import aboutMeJson from "public/json/about-me.json";
import { ReactNode } from "react";

const ProfileBox = ({ isDesktop }: { isDesktop: boolean }) => (
  <Center w="full">
    <VStack alignContent="center" spacing={isDesktop ? 4 : 2} w="full">
      <Box boxSize={isDesktop ? "64" : "48"} p="4">
        <Image
          objectFit="cover"
          src={profileImg.src}
          alt="Khoa Le"
          borderRadius="full"
        />
      </Box>
      <Heading size={isDesktop ? "2xl" : "xl"} textAlign="center">
        <TypeWriter text={aboutMeJson.introduction1} />
      </Heading>
      <Text fontSize={isDesktop ? "md" : "sm"} color="gray.300" align="center">
        {aboutMeJson.introduction2}
      </Text>
      <Box p="1"></Box>
      <Box maxW="2xl" px={4}>
        <Text
          fontSize={isDesktop ? "md" : "sm"}
          align="center"
          whiteSpace={"break-spaces"}
        >
          {aboutMeJson.summary}
        </Text>

        <Box p="2"></Box>
        <Center>
          <NLink href={Routes.contact} passHref legacyBehavior>
            <Button colorScheme="blue" as="a" size={isDesktop ? "md" : "sm"}>
              Contact me!
            </Button>
          </NLink>
        </Center>
      </Box>
    </VStack>
  </Center>
);

const AboutMe: React.FC = () => {
  const isDesktop = useBreakpointValue({ base: false, md: true }) ?? false;
  const texts: ReactNode[] = aboutMeJson.skills;
  return (
    <Center
      p={isDesktop ? 4 : 2}
      minH={200}
      w="100%"
      h="calc(100vh)"
      color="white"
      alignContent="center"
      justifyContent="center"
      position={"relative"}
      overflow="hidden"
    >
      <Wrap
        direction="row"
        justify="center"
        zIndex={1}
        spacing={isDesktop ? 8 : 4}
        w="full"
      >
        <WrapItem>
          <ProfileBox isDesktop={isDesktop} />
        </WrapItem>
        {isDesktop && (
          <WrapItem>
            <Box p="4" w="64"></Box>
          </WrapItem>
        )}
        <WrapItem flex="1" minW={isDesktop ? "400px" : "100%"}>
          <Center w="full">
            <TagSphere texts={texts} />
          </Center>
        </WrapItem>
      </Wrap>
      <ScrollButton />
    </Center>
  );
};

export default AboutMe;
