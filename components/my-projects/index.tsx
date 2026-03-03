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
    <VStack alignContent="center" spacing={4} minH={"100vh"} w="full">
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
                background: "rgba(255, 255, 255, 0.05)",
                backdropFilter: "blur(10px)",
                boxShadow: "0 8px 32px 0 rgba(31, 38, 135, 0.37)",
                border: "1px solid rgba(255, 255, 255, 0.18)",
                borderRadius: "16px",
                color: "#fff",
              }}
              contentArrowStyle={{
                borderRight: "7px solid rgba(255, 255, 255, 0.1)",
              }}
              date={project.date}
              iconStyle={{
                background: project.iconBgColor ?? "rgba(255, 255, 255, 0.2)",
                display: "flex",
                justifyContent: "center",
                alignItems: "center",
                boxShadow: "0 0 15px rgba(49, 130, 206, 0.5)",
              }}
              icon={
                <Img
                  src={project.icon}
                  alt={project.name}
                  width={project.iconWidth ?? "32px"}
                  height={project.iconHeight ?? "32px"}
                />
              }
              hea
            >
              <ProjectItem project={project} />
            </VerticalTimelineElement>
          );
        })}
      </VerticalTimeline>
    </VStack>
  );
}
