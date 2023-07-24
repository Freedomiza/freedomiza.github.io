import React, { useCallback, useState } from "react";
import {
  Box,
  Heading,
  VStack,
  Drawer,
  DrawerBody,
  DrawerFooter,
  DrawerHeader,
  DrawerOverlay,
  DrawerContent,
  DrawerCloseButton,
  useDisclosure,
  Button,
} from "@chakra-ui/react";

import jsImg from "public/images/js-icon.svg";
import dartImg from "public/images/dart-lang.png";
import flutterImg from "public/images/flutter_logo.svg";
import reactImg from "public/images/react-icon.svg";
import angularImg from "public/images/angular-icon.svg";
import nextImg from "public/images/nextjs-icon.png";
import nodeImg from "public/images/node-icon.svg";

import skillsJson from "public/json/skills.json";

import ProjectList from "components/project-list";
import SkillItem from "components/skill-item";
import SubSkillItem from "components/sub-skill-item";
import styles from "./style.module.css";

const MySkill: React.FC = () => {
  const [selectedSkill, setSelectedSkill] = useState("");
  const { isOpen, onOpen, onClose } = useDisclosure();
  const [isTooltipOpen, setIsTooltipOpen] = useState(true);
  const onSkillSelected = useCallback(
    (skill: string) => {
      setIsTooltipOpen(false);
      setSelectedSkill(skill);
      onOpen();
    },
    [onOpen]
  );

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
            onPress={() => {
              onSkillSelected("flutter");
            }}
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
            onPress={() => {
              onSkillSelected("next");
            }}
          />

          <SubSkillItem
            name="ReactJs"
            icon={reactImg}
            level={4}
            color="gray.200"
            onPress={() => {
              onSkillSelected("react");
            }}
          />
          <SubSkillItem
            name="NodeJs"
            icon={nodeImg}
            level={3}
            color="gray.200"
            onPress={() => {
              onSkillSelected("node");
            }}
          />

          <SubSkillItem
            name="Angular"
            icon={angularImg}
            level={3}
            color="gray.200"
            onPress={() => {
              onSkillSelected("angular");
            }}
          />
        </VStack>
      </Box>

      <Drawer isOpen={isOpen} placement="right" onClose={onClose} size={"md"}>
        <DrawerOverlay />
        <DrawerContent>
          <DrawerCloseButton />
          <DrawerHeader>{`My ${selectedSkill}'s projects`}</DrawerHeader>

          <DrawerBody>
            <ProjectList projects={skillsJson[selectedSkill]} />
          </DrawerBody>

          <DrawerFooter>
            <Button variant="outline" mr={3} onClick={onClose}>
              Close
            </Button>
          </DrawerFooter>
        </DrawerContent>
      </Drawer>
    </>
  );
};

export default MySkill;
