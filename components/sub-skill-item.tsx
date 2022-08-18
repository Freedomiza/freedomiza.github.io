import { Box, Image, Center, Text, HStack, Spacer } from "@chakra-ui/react";
import React from "react";
import { StarIcon } from "@chakra-ui/icons";
import { StaticImageData } from "next/image";
interface SubSkillItemProps {
  name: string;
  level: number;
  color: string;
  icon?: string | StaticImageData;
  onPress: VoidFunction;
}

const SubSkillItem = React.forwardRef<HTMLDivElement, SubSkillItemProps>(
  ({ name, level, color, icon, onPress }: SubSkillItemProps, ref) => {
    return (
      <Center
        minW="xs"
        maxW="md"
        w="100%"
        minH="80px"
        bg={color}
        pl="8"
        ref={ref}
        onClick={onPress}
        _hover={{
          boxShadow: "outline",
          cursor: "pointer",
        }}
      >
        <HStack w="100%" p="4">
          <Box boxSize="32px">
            {icon != null && typeof icon === "object" && (
              <Image src={icon.src} alt={name} width={"32px"} height={"32px"} />
            )}
            {icon != null && typeof icon === "string" && (
              <Image src={icon} alt={name} />
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
SubSkillItem.displayName = "SubSkillItem";

export default SubSkillItem;
