import {
  Image,
  Box,
  Center,
  Heading,
  VStack,
  Text,
  Wrap,
  WrapItem,
} from "@chakra-ui/react";
import AnimatedBackground from "components/3d-background/3d-background";
import profileImg from "public/images/profile.png";
import ScrollButton from "../scroll-button";
import TagSphere from "../tag-sphere";
import TypeWriter from "../type-writer";

const AboutMe: React.FC = () => {
  const texts: String[] = [
    "React",
    "Angular",
    "NodeJs",
    "NextJs",
    "Dart",
    "Flutter",
    "JavaScript",
    "TypeScript",
    "CSS",
    "SCSS",
    "HTML5",
    "Gatsby",
  ];
  const profileBox = (
    <Center>
      <VStack alignContent="center">
        <Box boxSize="64" p="4">
          <Image objectFit="cover" src={profileImg.src} alt="Khoa Le" />
        </Box>
        <Heading size={"2xl"}>
          <TypeWriter text="I'm Khoa Le" />
        </Heading>
        <Text size="xs" color="gray.300" align="center">
          Frontend developer, creating awesome websites and mobile apps
        </Text>
        <Box p="1"></Box>
        <Box maxW="2xl">
          <Text size="md" maxW="2xl" align="center">
            I’m a 8-years experienced developer in software/mobile development.
            Experienced in React, Angular and hybrid mobile apps like React
            Native and Flutter.
            <br />
            {"I 'd love to research new web technologies and building a cool"}
            product based on mobile or web application.
          </Text>
          <Box p="2"></Box>
        </Box>
      </VStack>
    </Center>
  );
  return (
    <AnimatedBackground>
      <Center
        p={4}
        minH={200}
        h="calc(100vh - 64px)"
        color="white"
        alignContent="center"
        justifyContent="center"
        // bgGradient="linear(to-r, #222833, #171D26, #222833)"
        position={"relative"}
      >
        <Wrap direction="row">
          <WrapItem>{profileBox}</WrapItem>
          <WrapItem>
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
