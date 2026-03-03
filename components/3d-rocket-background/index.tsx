import React, { useEffect, useRef } from "react";
import { Box } from "@chakra-ui/react";
import Image from "next/image";
import styles from "./styles.module.css";

const RocketBackground = () => {
  const mountRef = useRef<HTMLDivElement>(null);
  const fireRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const mountNode = mountRef.current;
    if (!mountNode || !(window as any).THREE) return;

    const THREE = (window as any).THREE;

    let width = mountNode.clientWidth;
    let height = mountNode.clientHeight;

    const scene = new THREE.Scene();

    // Subtle fog to blend perfectly with the dark theme
    scene.fog = new THREE.Fog(0x1a202c, 10, 1500);

    const aspectRatio = width / height;
    const camera = new THREE.PerspectiveCamera(60, aspectRatio, 1, 10000);
    camera.position.set(0, -10, 500);

    const renderer = new THREE.WebGLRenderer({
      alpha: true,
      antialias: true,
    });
    renderer.setSize(width, height);
    renderer.shadowMap.enabled = true;
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

    mountNode.appendChild(renderer.domElement);

    const handleResize = () => {
      if (!mountNode) return;
      width = mountNode.clientWidth;
      height = mountNode.clientHeight;
      camera.aspect = width / height;
      camera.updateProjectionMatrix();
      renderer.setSize(width, height);
      renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    };

    window.addEventListener("resize", handleResize);

    const ambientLight = new THREE.HemisphereLight(0x404040, 0x404040, 1);
    const directionalLight = new THREE.DirectionalLight(0xdfebff, 1);
    directionalLight.position.set(-300, 0, 600);
    const pointLight = new THREE.PointLight(0xa11148, 2, 1000, 2);
    pointLight.position.set(200, -100, 50);

    scene.add(ambientLight, directionalLight, pointLight);

    let rocket: any = null;
    const loader = new THREE.GLTFLoader();
    loader.load(
      "/images/rocket.gltf",
      (gltf: any) => {
        rocket = gltf.scene;
        rocket.position.y = 50;
        scene.add(rocket);
      },
      undefined,
      (error: any) => {
        console.error("Error loading rocket model", error);
      },
    );

    // Mouse tracking variables for parallax effect
    let mouseX = 0;
    let mouseY = 0;

    const handleMouseMove = (event: MouseEvent) => {
      mouseX = (event.clientX - window.innerWidth / 2) * 0.1;
      mouseY = (event.clientY - window.innerHeight / 2) * 0.1;
    };

    window.addEventListener("mousemove", handleMouseMove);

    const targetRocketPosition = 40;
    const animationDuration = 2000;
    let animationId: number;

    const tick = () => {
      const t = (Date.now() % animationDuration) / animationDuration;

      // Update camera position with easing for mouse parallax
      camera.position.x += (mouseX - camera.position.x) * 0.05;
      camera.position.y += (-mouseY - (camera.position.y + 10)) * 0.05;

      const bounceOffset = targetRocketPosition * Math.sin(Math.PI * 2 * t);

      if (rocket) {
        rocket.rotation.y += 0.05;
        rocket.position.y = bounceOffset;
      }

      // Sync the fire element's translation to match the camera parallax
      // We do this by applying a transform directly to its style
      if (fireRef.current) {
        const shiftX = -camera.position.x * 0.5;
        // As rocket bounces, the fire element should ideally bounce with it
        const shiftY = camera.position.y * 0.5 - bounceOffset;
        fireRef.current.style.transform = `translate(calc(-50% + ${shiftX}px), ${shiftY}px) rotate3d(1, 0, 0, 60deg)`;
      }

      renderer.render(scene, camera);
      animationId = window.requestAnimationFrame(tick);
    };

    tick();

    return () => {
      window.removeEventListener("resize", handleResize);
      window.removeEventListener("mousemove", handleMouseMove);
      window.cancelAnimationFrame(animationId);
      if (mountNode && renderer.domElement) {
        mountNode.removeChild(renderer.domElement);
      }
      renderer.dispose();
      scene.clear();
    };
  }, []);

  return (
    <Box className={styles.container}>
      <div ref={fireRef} className={styles.fireWrapper}>
        <Image
          className={styles.fire}
          src="https://stivs.dev/assets/rocket/fire.svg"
          alt=""
          width={100}
          height={100}
          unoptimized
        />
      </div>
      <div className={`${styles.rain} ${styles.rain1}`}></div>
      <div className={`${styles.rain} ${styles.rain2}`}>
        <div className={`${styles.drop} ${styles.drop2}`}></div>
      </div>
      <div className={`${styles.rain} ${styles.rain3}`}></div>
      <div className={`${styles.rain} ${styles.rain4}`}></div>
      <div className={`${styles.rain} ${styles.rain5}`}>
        <div className={`${styles.drop} ${styles.drop5}`}></div>
      </div>
      <div className={`${styles.rain} ${styles.rain6}`}></div>
      <div className={`${styles.rain} ${styles.rain7}`}></div>
      <div className={`${styles.rain} ${styles.rain8}`}>
        <div className={`${styles.drop} ${styles.drop8}`}></div>
      </div>
      <div className={`${styles.rain} ${styles.rain9}`}></div>
      <div className={`${styles.rain} ${styles.rain10}`}></div>
      <div className={`${styles.drop} ${styles.drop11}`}></div>
      <div className={`${styles.drop} ${styles.drop12}`}></div>
      <div ref={mountRef} className={styles.canvas} />
    </Box>
  );
};

export default RocketBackground;
