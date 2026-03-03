import Navbar from "./navbar";
import Footer from "./footer";
import { Container } from "@chakra-ui/react";

export default function Layout({ children }) {
  return (
    <>
      {/* <Navbar /> */}
      <Container
        as="main"
        minHeight={"100vh"}
        maxW={"100%"}
        background={"transparent"}
        p={0}
      >
        {children}
      </Container>
      <Footer />
    </>
  );
}
