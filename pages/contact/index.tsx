import { Box, Center, Text, VStack } from "@chakra-ui/react";
import Layout from "components/common/layouts";
import ContactButton from "./_components/contact-button";

export default function Contact() {
  const contacts = [
    {
      id: 111,
      href: "skype://freedom_iza",
      name: "Skype",
      icon: "/images/skype-icon.svg",
    },
    {
      id: 222,
      href: "https://github.com/Freedomiza",
      name: "Github",
      icon: "/images/github-logo.svg",
    },
    {
      id: 333,
      href: "https://www.linkedin.com/in/khoa-le-b31b22a8/",
      name: "Linkedin",
      icon: "/images/linkedin-icon.svg",
    },
  ];
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
