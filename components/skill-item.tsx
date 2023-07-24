import {
  Box,
  Img,
  Center,
  Heading,
  Text,
  HStack,
  Spacer,
} from "@chakra-ui/react";
import React from "react";
import { StarIcon } from "@chakra-ui/icons";
import { StaticImageData } from "next/image";

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
              <Img src={icon.src} alt={name} width={"32px"} height={"32px"} />
            )}
            {icon != null && typeof icon === "string" && (
              <Img src={icon} alt={name} />
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
                <Center key={`star_${Math.random()}}`} w="4" h="4" pr="3">
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
