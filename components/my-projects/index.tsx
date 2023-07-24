import React, { useEffect, useMemo } from "react";

import { Box, Heading, VStack, Img, useFocusEffect } from "@chakra-ui/react";
import skillsJson from "assets/json/skills.json";

import {
  VerticalTimeline,
  VerticalTimelineElement,
} from "react-vertical-timeline-component";
import "react-vertical-timeline-component/style.min.css";

import SkillItem from "components/skill-item";

// type ProjectByTech = {
//   id: string;
//   icon: string;
//   name: string;
//   description: string;
//   content: string[];
//   tech: string[];
//   demo: any;
// };

export default function MyProjects() {
  const projects = useMemo(() => {
    let arr = [];
    skillsJson.forEach((skillItem) => {
      arr.push(...skillItem.projects);
    });

    return arr;
  }, []);
  console.log({ projects });

  return (
    <VStack alignContent="center" spacing={4} minH={"100vh"}>
      <Box p="4" />
      <Heading>My Projects</Heading>
      <Box p="1" />
      <VerticalTimeline>
        {projects.map((skill, index) => {
          return (
            <VerticalTimelineElement
              key={`${skill.id}_${skill.name}`}
              className="vertical-timeline-element--work"
              contentStyle={{
                background: "#FDFDFD",
              }}
              contentArrowStyle={{
                borderRight: "7px solid #FDFDFD",
              }}
              date="2011 - present"
              iconStyle={{
                background: "#FDFDFD",
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
              }}
              icon={
                <Img
                  src={skill.icon}
                  alt={skill.name}
                  width={"32px"}
                  height={"32px"}
                />
              }
            >
              <SkillItem
                name={skill.name}
                icon={skill.icon}
                level={skill.level}
                color="white"
              />
            </VerticalTimelineElement>
          );
        })}
      </VerticalTimeline>
    </VStack>
  );
}
