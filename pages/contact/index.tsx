import { Box, Center, Text, VStack } from "@chakra-ui/react";

import Layout from "components/common/layouts";
import ContactButton from "components/contact-button";
import contactMeJson from "public/json/contact-me.json";

type Contact = {
  id: string;
  href: string;
  name: string;
  icon: string;
};

export default function Contact() {
  const contacts = contactMeJson;
  return (
    <>
      <Center
        w="100%"
        minHeight={"100vh"}
        bgGradient="linear(to-r, #222833, #171D26)"
      >
        <Center>
          <Box
            maxW="lg"
            borderWidth="1px"
            borderRadius="lg"
            overflow="hidden"
            color="white"
            width={80}
          >
            <Box p="6">
              <VStack w="100%">
                <Box display="flex" alignItems="baseline">
                  <Text fontSize="xl">Contact</Text>
                </Box>
                {contacts.map((contact) => (
                  <ContactButton
                    key={contact.id}
                    href={contact.href}
                    name={contact.name}
                    icon={contact.icon}
                  />
                ))}
              </VStack>
            </Box>
          </Box>
        </Center>
      </Center>
    </>
  );
}

Contact.getLayout = function getLayout(page) {
  return <Layout>{page}</Layout>;
};
