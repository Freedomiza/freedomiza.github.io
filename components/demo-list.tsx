import { Box, Button, Flex, Text, Image } from "@chakra-ui/react";

export interface DemoProps {
  web?: string;
  android?: string;
  ios?: string;
}

const DemoList = ({ demos = [] }: { demos: DemoProps[] }) => {
  return (
    <>
      {demos.map((demo) => (
        <Box w="100%" key={demo.web || demo.ios}>
          <Flex wrap="wrap" gap={3} w="100%" align="center">
            {demo.web && (
              <Button
                onClick={() => window.open(demo.web)}
                variant="outline"
                bg="rgba(255, 255, 255, 0.08)"
                backdropFilter="blur(10px)"
                border="1px solid rgba(49, 130, 206, 0.4)"
                _hover={{
                  bg: "rgba(49, 130, 206, 0.2)",
                  transform: "translateY(-2px)",
                  boxShadow: "0 0 20px rgba(49, 130, 206, 0.4)",
                  borderColor: "blue.300",
                }}
                transition="all 0.3s"
                display="inline-flex"
                alignItems="center"
                justifyContent="center"
                minW={{ base: "40px", md: "auto" }}
                px={{ base: 2, md: 4 }}
                iconSpacing={{ base: 0, md: 2 }}
                leftIcon={
                  <Image
                    width="18px"
                    height="18px"
                    src={"/images/web-icon.svg"}
                    alt="web"
                    filter="brightness(0) invert(1) sepia(1) saturate(5) hue-rotate(180deg)"
                    flexShrink={0}
                  />
                }
              >
                <Text
                  as="span"
                  color="blue.200"
                  fontWeight="bold"
                  display={{ base: "none", md: "block" }}
                >
                  Website
                </Text>
              </Button>
            )}

            {demo.ios && (
              <Button
                variant="outline"
                bg="rgba(255, 255, 255, 0.08)"
                backdropFilter="blur(10px)"
                border="1px solid rgba(255, 255, 255, 0.2)"
                _hover={{
                  bg: "rgba(255, 255, 255, 0.15)",
                  transform: "translateY(-2px)",
                  boxShadow: "0 0 20px rgba(255, 255, 255, 0.2)",
                  borderColor: "whiteAlpha.500",
                }}
                transition="all 0.3s"
                title="iOS Store"
                onClick={() => window.open(demo.ios)}
                display="inline-flex"
                alignItems="center"
                justifyContent="center"
                minW={{ base: "40px", md: "auto" }}
                px={{ base: 2, md: 4 }}
                iconSpacing={{ base: 0, md: 2 }}
                leftIcon={
                  <Image
                    width="18px"
                    height="18px"
                    src={"/images/ios-icon.svg"}
                    alt="iOS"
                    filter="brightness(0) invert(1)"
                    flexShrink={0}
                  />
                }
              >
                <Text
                  as="span"
                  color="whiteAlpha.900"
                  fontWeight="bold"
                  display={{ base: "none", md: "block" }}
                >
                  iOS
                </Text>
              </Button>
            )}

            {demo.android && (
              <Button
                variant="outline"
                bg="rgba(255, 255, 255, 0.08)"
                backdropFilter="blur(10px)"
                border="1px solid rgba(255, 255, 255, 0.2)"
                _hover={{
                  bg: "rgba(255, 255, 255, 0.15)",
                  transform: "translateY(-2px)",
                  boxShadow: "0 0 20px rgba(164, 202, 58, 0.2)",
                  borderColor: "whiteAlpha.500",
                }}
                transition="all 0.3s"
                onClick={() => window.open(demo.android)}
                display="inline-flex"
                alignItems="center"
                justifyContent="center"
                minW={{ base: "40px", md: "auto" }}
                px={{ base: 2, md: 4 }}
                iconSpacing={{ base: 0, md: 2 }}
                leftIcon={
                  <Image
                    width="18px"
                    height="18px"
                    src={"/images/android-icon.svg"}
                    alt="android"
                    filter="brightness(0) invert(1) sepia(1) saturate(3) hue-rotate(60deg)"
                    flexShrink={0}
                  />
                }
              >
                <Text
                  as="span"
                  color="whiteAlpha.900"
                  fontWeight="bold"
                  display={{ base: "none", md: "block" }}
                >
                  Android
                </Text>
              </Button>
            )}
          </Flex>
        </Box>
      ))}
    </>
  );
};

export default DemoList;
