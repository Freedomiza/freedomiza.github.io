import React from "react";
import styles from "./style.module.css";

const ScrollButton: React.FC = () => (
  <div className={styles["scroll-downs"]}>
    <div className={styles.mousey}>
      <div className={styles.scroller}></div>
    </div>
  </div>
);

export default ScrollButton;
