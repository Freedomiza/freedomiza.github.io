import Script from "next/script";
import React, { useEffect } from "react";
import styles from "./style.module.css";
type TagSphereProps = {
  texts: String[];
};

const TagSphere: React.FC<TagSphereProps> = ({ texts }) => {
  useEffect(() => {
    import("../../libs/tag-cloud.js").then((response) => {
      const tagCloud = response.default;
      tagCloud(`.${styles["tagcloud-container"]}`, texts, {
        radius: screen.width > 500 ? 300 : 100,
        maxSpeed: "fast",
        initSpeed: "normal",
        direction: 100,
        keep: false,
        useContainerInlineStyles: false,
        sectionContainer: "about",
      });
    });
    return () => {
      let tagClouds = document.getElementsByClassName("tagcloud");
      for (let i = 0; i < tagClouds.length; i++) {
        tagClouds[0].remove();
      }
    };
  }, [texts]);

  return <div className={styles["tagcloud-container"]}></div>;
};

export default TagSphere;
