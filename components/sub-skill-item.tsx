import { Box, Image, Center, Text, HStack, Spacer } from "@chakra-ui/react";
import React from "react";
import { StarIcon } from "@chakra-ui/icons";
import { StaticImageData } from "next/image";
interface SubSkillItemProps {
  name: string;
  level: number;
  color: string;
  icon?: string | StaticImageData;
  onPress?: VoidFunction;
}

const SubSkillItem = React.forwardRef<HTMLDivElement, SubSkillItemProps>(
  ({ name, level, color, icon, onPress }: SubSkillItemProps, ref) => {
    return (
      <Center
        w="full"
        maxW="md"
        minH="80px"
        bg="rgba(255, 255, 255, 0.03)"
        backdropFilter="blur(10px)"
        borderRadius="xl"
        border="1px solid rgba(255, 255, 255, 0.05)"
        boxShadow="lg"
        color="whiteAlpha.900"
        pl="8"
        ref={ref}
        onClick={onPress}
        _hover={{
          bg: "rgba(255, 255, 255, 0.08)",
          transform: "translateY(-2px)",
          boxShadow: "outline",
          cursor: "pointer",
        }}
        transition="all 0.3s"
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

          <Box px="2">
            <Text fontWeight="medium" color="whiteAlpha.800">
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
SubSkillItem.displayName = "SubSkillItem";

export default SubSkillItem;
