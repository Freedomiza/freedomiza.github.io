import React from "react";
import { Box, Heading, VStack } from "@chakra-ui/react";

import jsImg from "public/images/js-icon.svg";
import dartImg from "public/images/dart-lang.png";
import flutterImg from "public/images/flutter_logo.svg";
import reactImg from "public/images/react-icon.svg";
import angularImg from "public/images/angular-icon.svg";
import nextImg from "public/images/nextjs-icon.png";
import nodeImg from "public/images/node-icon.svg";

import SkillItem from "components/skill-item";
import SubSkillItem from "components/sub-skill-item";
import styles from "./style.module.css";

const MySkill: React.FC = () => {
  return (
    <>
      <Box
        minH="100vh"
        color="gray.700"
        alignContent="center"
        justifyContent="center"
        bgColor="gray.100"
        className={styles.background}
      >
        <VStack alignContent="center" spacing={4}>
          <Box p="4" />
          <Heading>My Skill</Heading>
          <Box p="1" />

          <SkillItem name="dart" icon={dartImg} level={5} color="gray.300" />

          <SubSkillItem
            name="flutter"
            icon={flutterImg}
            level={5}
            color="gray.200"
          />

          <SkillItem
            name="javascript"
            icon={jsImg}
            level={5}
            color="gray.300"
          />
          <SubSkillItem
            name="NextJs"
            icon={nextImg}
            level={5}
            color="gray.200"
          />

          <SubSkillItem
            name="ReactJs"
            icon={reactImg}
            level={4}
            color="gray.200"
          />
          <SubSkillItem
            name="NodeJs"
            icon={nodeImg}
            level={3}
            color="gray.200"
          />

          <SubSkillItem
            name="Angular"
            icon={angularImg}
            level={3}
            color="gray.200"
          />
        </VStack>
      </Box>
    </>
  );
};

export default MySkill;
