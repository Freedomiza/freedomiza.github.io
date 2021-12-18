import Navbar from "./navbar";
import Footer from "./footer";
import { Container } from "@chakra-ui/react";

export default function Layout({ children }) {
  return (
    <>
      <Navbar />
      <Container
        as="main"
        minHeight={"100vh"}
        maxW={"100%"}
        background={"linear-gradient(to bottom, #f5f5f5, #e5e5e5)"}
      >
        {children}
      </Container>
      <Footer />
    </>
  );
}
