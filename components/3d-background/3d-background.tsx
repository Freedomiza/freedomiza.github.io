import React, { useState, useEffect, useRef } from "react";
import DOTS from "vanta/dist/vanta.net.min.js";
// Make sure window.THREE is defined, e.g. by including three.min.js in the document head using a <script> tag

const AnimatedBackground = ({ children }: { children?: React.ReactNode }) => {
  const [vantaEffect, setVantaEffect] = useState(null);
  const myRef = useRef(null);

  useEffect(() => {
    if (!vantaEffect && myRef.current) {
      setVantaEffect(
        DOTS({
          el: myRef.current,
          mouseControls: true,
          touchControls: true,
          gyroControls: false,
          minHeight: 200.0,
          minWidth: 200.0,
          scale: 1.0,
          scaleMobile: 1.0,
          backgroundColor: 0x1a202c, // Dark slate background to match Cyber-Fluid theme
          color: 0x3182ce, // Blue dots
        }),
      );
    }
    return () => {
      if (vantaEffect) vantaEffect.destroy();
    };
  }, [vantaEffect]);

  return (
    <div
      ref={myRef}
      style={{
        width: "100%",
        height: "100%",
        position: "absolute",
        top: 0,
        left: 0,
        zIndex: -1,
      }}
    >
      {children}
    </div>
  );
};

export default AnimatedBackground;
