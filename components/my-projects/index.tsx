import React, { useEffect, useMemo } from "react";

import { Box, Heading, VStack, Img } from "@chakra-ui/react";
import skillsJson from "public/json/skills.json";

import {
  VerticalTimeline,
  VerticalTimelineElement,
} from "react-vertical-timeline-component";
import "react-vertical-timeline-component/style.min.css";

import ProjectItem from "./project-item";
import { ProjectByTech } from "./type";

const defaultBgColor = "#FDFDFD";

export default function MyProjects() {
  const projects = useMemo(() => {
    let arr = [];
    skillsJson.forEach((skillItem) => {
      arr.push(...skillItem.projects);
    });

    return arr;
  }, []);

  return (
    <VStack alignContent="center" spacing={4} minH={"100vh"}>
      <Box p="4" />
      <Heading>My Projects</Heading>
      <Box p="1" />
      <VerticalTimeline>
        {projects.map((project: ProjectByTech, index) => {
          return (
            <VerticalTimelineElement
              key={`${project.id}_${project.name}`}
              className="vertical-timeline-element--work"
              contentStyle={{
                background: defaultBgColor,
              }}
              contentArrowStyle={{
                borderRight: `7px solid ${defaultBgColor}`,
              }}
              date={project.date}
              iconStyle={{
                background: project.iconBgColor ?? defaultBgColor,
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
              }}
              icon={
                <Img
                  src={project.icon}
                  alt={project.name}
                  width={project.iconWidth ?? "32px"}
                  height={project.iconHeight ?? "32px"}
                />
              }
            >
              <ProjectItem project={project} />
            </VerticalTimelineElement>
          );
        })}
      </VerticalTimeline>
    </VStack>
  );
}
