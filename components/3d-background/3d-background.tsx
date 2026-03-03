import React, { useEffect, useRef } from "react";
import DOTS from "vanta/dist/vanta.net.min.js";
// Make sure window.THREE is defined, e.g. by including three.min.js in the document head using a <script> tag

const AnimatedBackground = ({ children }: { children?: React.ReactNode }) => {
  const vantaEffectRef = useRef<any>(null);
  const myRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!vantaEffectRef.current && myRef.current) {
      vantaEffectRef.current = DOTS({
        el: myRef.current,
        mouseControls: false, // Disabled to reduce raycasting calculations on hover/scroll
        touchControls: false, // Disabled to save memory/battery on mobile
        gyroControls: false,
        minHeight: 200.0,
        minWidth: 200.0,
        scale: 1.0,
        scaleMobile: 1.0,
        backgroundColor: 0x1a202c, // Dark slate background to match Cyber-Fluid theme
        color: 0x3182ce, // Blue dots
        spacing: 35.0, // Increased spacing creates fewer nodes, drastically reducing GPU usage
      });
    }
    return () => {
      if (vantaEffectRef.current) {
        vantaEffectRef.current.destroy();
        vantaEffectRef.current = null;
      }
    };
  }, []);

  return (
    <div
      ref={myRef}
      style={{
        width: "100%",
        height: "100vh", // Restrict WebGL canvas to viewport height to avoid 700vh massive 3D VRAM allocations
        position: "sticky", // Kept sticky so it spans over the ParallaxLayer's total height while staying in bounds
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
