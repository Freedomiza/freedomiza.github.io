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
  Button,
  Wrap,
  WrapItem,
  Tag,
  HStack,
  CardFooter,
} from "@chakra-ui/react";
import { ProjectByTech } from "../type";

type ProjectItemProps = {
  project: ProjectByTech;
};

export default function ProjectItem({
  project,
}: ProjectItemProps): React.ReactNode {
  return (
    <>
      <Card maxW="md" variant="outline">
        <CardHeader>
          <Flex justifyContent="space-between">
            <Heading size="sm"> {project.name}</Heading>
            <Img
              src={project.icon}
              alt={project.name}
              width="32px"
              height="32px"
            />
          </Flex>
          <Box>
            <Text fontSize="md">{project.description}</Text>
          </Box>
        </CardHeader>
        {/* <Divider /> */}

        <CardBody>
          <Stack divider={<StackDivider />} spacing="4">
            <Box>
              {project.content.map((item) => (
                <Text key={item} fontSize="md">
                  {item}
                </Text>
              ))}

              <Text fontSize="md">
                Tech:
                <HStack spacing={2} wrap={"wrap"}>
                  {project.tech.map((techItem) => (
                    <Tag key={techItem} size={"md"}>
                      {techItem}
                    </Tag>
                  ))}
                </HStack>
              </Text>
            </Box>
          </Stack>
        </CardBody>
        <CardFooter>
          <Box>
            <Text fontSize="md">Demo / Sites</Text>
            <DemoItem demo={project.demo} />
          </Box>
        </CardFooter>
      </Card>
    </>
  );
}

const DemoItem = ({ demo }) => {
  return (
    <Wrap>
      {demo.web && (
        <WrapItem>
          <Button as="a" href={demo.web} target="_blank" variant="outline">
            Website
          </Button>
        </WrapItem>
      )}
      {demo.ios && (
        <WrapItem>
          <Button as="a" href={demo.ios} target="_blank" variant="outline">
            <Img
              src="/images/ios-icon.svg"
              alt="ios"
              width="16px"
              height="16px"
            />
          </Button>
        </WrapItem>
      )}
      {demo.android && (
        <WrapItem>
          <Button as="a" href={demo.android} target="_blank" variant="outline">
            <Img
              src="/images/android-icon.svg"
              alt="ios"
              width="16px"
              height="16px"
            />
          </Button>
        </WrapItem>
      )}
    </Wrap>
  );
};
