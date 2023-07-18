import DemoList, { DemoProps } from "./demo-list";

import {
  Divider,
  Box,
  Heading,
  Text,
  VStack,
  Image,
  Flex,
} from "@chakra-ui/react";
import Lottie from "lottie-react";
import * as animationData from "assets/json/404-not-found.json";

interface ProjectListProps {
  projects: ProjectProps[];
}

interface ProjectProps {
  icon: string;
  id: string;
  name: string;
  description: string;
  content: string[];
  tech: string[];
  demo: DemoProps[];
  iconWidth?: string | number;
  iconBgColor?: string;
}

const ProjectList = ({ projects }: ProjectListProps) => {
  return (
    <>
      {projects &&
        projects.map((project) => (
          <VStack key={project.id}>
            <Box p="1" w="100%">
              <Flex alignContent={"center"} justifyItems={"center"}>
                <Image
                  src={project.icon}
                  alt={project.name}
                  width={project.iconWidth || 8}
                  bg={project.iconBgColor || "gray.100"}
                  mr="4"
                />
                <Heading size="md">{project.name}</Heading>
              </Flex>
              <Box pb="4" />
              <Text size="sm">{project.description}</Text>
              {project.content.map((contentText) => (
                <Text size="md" key={contentText} as="p">
                  {contentText}
                </Text>
              ))}
              <Box pb="4" />

              <Heading size="sm">Technology used:</Heading>
              {project.tech.map((techText) => (
                <Text size="md" key={techText} as="p">
                  {techText}
                </Text>
              ))}

              <Box p="4">
                <DemoList demos={project.demo} />
              </Box>
            </Box>

            <Divider />
            <Box p="4" />
          </VStack>
        ))}
      {(!projects || projects.length === 0) && (
        <VStack>
          <Box p="4" w="100%">
            <Lottie height={200} width={200} animationData={animationData} />
          </Box>
          <Heading size="md" textAlign={"center"}>
            Oops! there seem to be no data in this skills
          </Heading>
          <Text size="xl" textAlign={"center"}>
            That doesn&apos;t mean I don&apos;t know how to do it. It only mean
            I have more to learn
          </Text>
        </VStack>
      )}
    </>
  );
};

export default ProjectList;
