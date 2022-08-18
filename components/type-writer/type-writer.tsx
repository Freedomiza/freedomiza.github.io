import React from "react";
import styles from "./style.module.css";
type TypeWriterProps = {
  text: String;
};

const TypeWriter: React.FC<TypeWriterProps> = ({ text }) => {
  return (
    <div className={styles.typewriter}>
      <h1>{text}</h1>
    </div>
  );
};

export default TypeWriter;
