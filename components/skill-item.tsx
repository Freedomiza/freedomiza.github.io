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
      <Center
        w="full"
        maxW="md"
        h="90px"
        bg="rgba(255, 255, 255, 0.05)"
        backdropFilter="blur(10px)"
        borderRadius="xl"
        border="1px solid rgba(255, 255, 255, 0.1)"
        boxShadow="xl"
        color="whiteAlpha.900"
      >
        <HStack w="100%" p="4" ref={ref}>
          <Box boxSize="32px">
            {icon != null && typeof icon === "object" && (
              <Img src={icon.src} alt={name} width={"32px"} height={"32px"} />
            )}
            {icon != null && typeof icon === "string" && (
              <Img src={icon} alt={name} />
            )}
          </Box>

          <Box px="2">
            <Text fontSize="xs" color="whiteAlpha.500" textTransform="uppercase" letterSpacing="wider">
              Language
            </Text>
            <Text fontWeight="bold" color="blue.200" textTransform="capitalize">
              {name}
            </Text>
          </Box>
          <Spacer />
          <Center px="2">
            {Array(level)
              .fill("")
              .map((_, index) => (
                <Center key={`star_${name}_${index}`} w="4" h="4" pr="1">
                  <StarIcon color="yellow.400" />
                </Center>
              ))}
          </Center>
        </HStack>
      </Center>
    );
  },
);

SkillItem.displayName = "SkillItem";
export default SkillItem;
