import React, { useState, useEffect, useRef } from "react";
import DOTS from "vanta/dist/vanta.dots.min";
// Make sure window.THREE is defined, e.g. by including three.min.js in the document head using a <script> tag

const AnimatedBackground = (props) => {
  const [vantaEffect, setVantaEffect] = useState<any>(null);
  const myRef = useRef(null);
  useEffect(() => {
    if (!vantaEffect) {
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
        })
      );
    }
    return () => {
      if (vantaEffect) vantaEffect.destroy();
    };
  }, [vantaEffect]);
  return <div ref={myRef}>{props.children}</div>;
};

export default AnimatedBackground;
