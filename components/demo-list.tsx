import { Box, Button, HStack, Text, Image } from "@chakra-ui/react";

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
          <HStack spacing={4} w="100%">
            {demo.web && (
              <Button
                onClick={() => window.open(demo.web)}
                variant="solid"
                colorScheme="blue"
                maxW={"sm"}
                leftIcon={
                  <Image
                    width="24px"
                    height="24px"
                    src={"/images/web-icon.svg"}
                    alt="web"
                  />
                }
              >
                <Text>Web</Text>
              </Button>
            )}

            {demo.ios && (
              <Button
                maxW={"sm"}
                title="iOS Store"
                onClick={() => window.open(demo.ios)}
                leftIcon={
                  <Image
                    width="24px"
                    height="24px"
                    src={"/images/ios-icon.svg"}
                    alt="iOS"
                  />
                }
              >
                <Text> iOS</Text>
              </Button>
            )}

            {demo.android && (
              <Button
                onClick={() => window.open(demo.android)}
                leftIcon={
                  <Image
                    width="24px"
                    height="24px"
                    src={"/images/android-icon.svg"}
                    alt="android"
                  />
                }
              >
                Android
              </Button>
            )}
          </HStack>
        </Box>
      ))}
    </>
  );
};

export default DemoList;
