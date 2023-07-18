import { Button, Image, Box, Text } from "@chakra-ui/react";
interface ContactButtonProps {
  href: string;
  name: string;
  icon: string;
}
const ContactButton = ({ href, name, icon }: ContactButtonProps) => {
  return (
    <Button
      variant={"outline-white"}
      as="a"
      href={href}
      rel="noreferrer"
      target="_blank"
      leftIcon={
        <Box boxSize={"24px"}>
          <Image src={icon} alt={name} objectFit="cover" />
        </Box>
      }
    >
      <Text>{name}</Text>
    </Button>
  );
};

export default ContactButton;
