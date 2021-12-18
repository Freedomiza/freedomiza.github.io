import {
  Box,
  Image,
  Center,
  Heading,
  Text,
  VStack,
  HStack,
  Spacer,
  Tooltip,
} from "@chakra-ui/react";
import React from "react";
import { StarIcon } from "@chakra-ui/icons";
interface SkillItemProps {
  name: string;
  level: number;
  color: string;
  icon?: string | StaticImageData;
}

const SkillItem = React.forwardRef<HTMLDivElement, SkillItemProps>(
  ({ name, level, color, icon }: SkillItemProps, ref) => {
    return (
      <Center minW="xs" maxW="md" w="100%" h="80px" bg={color}>
        <HStack w="100%" p="4" ref={ref}>
          <Box boxSize="32px">
            {icon != null && typeof icon === "object" && (
              <Image
                src={icon.src}
                alt={name}
                width={"32px"}
                height={"32px"}
                layout="responsive"
              />
            )}
            {icon != null && typeof icon === "string" && (
              <Image src={icon} alt={name} layout="responsive" />
            )}
          </Box>

          <Box p="4">
            <Text>{name}</Text>
          </Box>
          <Spacer />
          <Center p="4">
            {Array(level)
              .fill("")
              .map((_) => (
                <Center key={`star_${Math.random()}}`} size="4" pr="3">
                  <StarIcon color="yellow.500" />
                </Center>
              ))}
          </Center>
        </HStack>
      </Center>
    );
  }
);

SkillItem.displayName = "SkillItem";
export default SkillItem;
