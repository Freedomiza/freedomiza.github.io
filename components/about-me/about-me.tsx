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
  Flex,
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

const profileBox = (
  <Center>
    <VStack alignContent="center">
      <Box boxSize="64" p="4">
        <Image objectFit="cover" src={profileImg.src} alt="Khoa Le" />
      </Box>
      <Heading size={"2xl"}>
        <TypeWriter text={aboutMeJson.introduction1} />
      </Heading>
      <Text size="xs" color="gray.300" align="center">
        {aboutMeJson.introduction2}
      </Text>
      <Box p="1"></Box>
      <Box maxW="2xl">
        <Text size="md" maxW="2xl" align="center" whiteSpace={"break-spaces"}>
          {aboutMeJson.summary}
        </Text>

        <Box p="4" alignItems="center"></Box>
        <Center>
          <Button colorScheme="blue">
            <NLink href={Routes.contact} passHref legacyBehavior>
              <Link> Contact me!</Link>
            </NLink>
          </Button>
        </Center>
      </Box>
    </VStack>
  </Center>
);

const AboutMe: React.FC = () => {
  const texts: ReactNode[] = aboutMeJson.skills;
  return (
    <AnimatedBackground>
      <Center
        p={2}
        minH={200}
        w="calc(100vw)"
        h="calc(100vh)"
        color="white"
        alignContent="center"
        justifyContent="center"
        position={"relative"}
      >
        <Wrap direction="row" justify="center">
          <WrapItem>
            <Center>{profileBox}</Center>
          </WrapItem>
          <WrapItem>
            <Box p="4" w="64"></Box>
          </WrapItem>
          <WrapItem flex="1">
            <Center>
              <TagSphere texts={texts} />
            </Center>
          </WrapItem>
        </Wrap>
        <ScrollButton />
      </Center>
    </AnimatedBackground>
  );
};

export default AboutMe;
