import {
  Box,
  Heading,
  Card,
  CardHeader,
  CardBody,
  StackDivider,
  Stack,
  Text,
  Img,
  Flex,
  Wrap,
  WrapItem,
  Tag,
  HStack,
  CardFooter,
  useBreakpointValue,
} from "@chakra-ui/react";
import { ProjectByTech } from "../type";
import DemoList from "../../demo-list";

type ProjectItemProps = {
  project: ProjectByTech;
};

export default function ProjectItem({
  project,
}: ProjectItemProps): React.ReactNode {
  return (
    <>
      <Card
        maxW="2xl"
        variant="unstyled"
        color="white"
        p={useBreakpointValue({ base: 2, md: 4 })}
        bg={useBreakpointValue({ base: "whiteAlpha.100", md: "transparent" })}
        backdropFilter={useBreakpointValue({ base: "blur(10px)", md: "none" })}
        borderRadius="xl"
      >
        <CardHeader>
          <Flex justifyContent="space-between" alignItems="center">
            <Heading size={"md"} color="white" as="span">
              {project.name}
            </Heading>
            <Img
              src={project.icon}
              alt={project.name}
              width="32px"
              height="32px"
            />
          </Flex>
          <Box pt={2}>
            <Text fontSize="md" color="whiteAlpha.900" fontWeight="medium">
              {project.description}
            </Text>
          </Box>
        </CardHeader>
        {/* <Divider /> */}

        <CardBody>
          <Stack
            divider={<StackDivider borderColor="whiteAlpha.100" />}
            spacing="4"
          >
            <Box>
              {project.content.map((item) => (
                <Text key={item} fontSize="sm" color="whiteAlpha.800" pb={1}>
                  • {item}
                </Text>
              ))}

              <Box pt={4}>
                <Text fontSize="sm" fontWeight="bold" color="blue.200" mb={2}>
                  Tech Stack:
                </Text>
                <HStack spacing={2} wrap={"wrap"}>
                  {project.tech.map((techItem) => (
                    <Tag
                      key={techItem}
                      size={"sm"}
                      variant="subtle"
                      colorScheme="blue"
                    >
                      {techItem}
                    </Tag>
                  ))}
                </HStack>
              </Box>
            </Box>
          </Stack>
        </CardBody>
        <CardFooter px={4} pb={4}>
          <Box w="full">
            <Text
              fontSize="xs"
              color="whiteAlpha.600"
              mb={2}
              textTransform="uppercase"
              letterSpacing="wider"
            >
              Explore Project
            </Text>
            <DemoList demos={[project.demo]} />
          </Box>
        </CardFooter>
      </Card>
    </>
  );
}
