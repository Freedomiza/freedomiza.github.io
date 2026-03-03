import React, { useEffect, useRef } from "react";
import { Box } from "@chakra-ui/react";

const WorkspaceDiorama = () => {
  const mountRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const mountNode = mountRef.current;
    if (!mountNode || !(window as any).THREE) return;

    const THREE = (window as any).THREE;

    const width = mountNode.clientWidth;
    const height = mountNode.clientHeight;

    const scene = new THREE.Scene();
    const textureLoader = new THREE.TextureLoader();

    // Base camera
    const camera = new THREE.PerspectiveCamera(30, width / height, 0.1, 100);
    camera.position.x = 18;
    camera.position.y = 10;
    camera.position.z = 20;
    scene.add(camera);

    // Renderer
    const renderer = new THREE.WebGLRenderer({
      antialias: true,
      alpha: true,
    });
    renderer.setSize(width, height);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    renderer.outputEncoding = THREE.sRGBEncoding;

    mountNode.appendChild(renderer.domElement);

    // Controls
    const controls = new THREE.OrbitControls(camera, renderer.domElement);
    controls.enableDamping = true;
    controls.enableZoom = false; // Disable zoom to prevent interfering with scrolling
    controls.enablePan = false;
    controls.minDistance = 10;
    controls.maxDistance = 20;
    controls.minPolarAngle = Math.PI / 4;
    controls.maxPolarAngle = Math.PI / 2.25;
    controls.minAzimuthAngle = -Math.PI / 16;
    controls.maxAzimuthAngle = Math.PI / 2;

    // Materials
    const bakedTexture = textureLoader.load(
      "https://rawcdn.githack.com/ricardoolivaalonso/ThreeJS-Room01/98fd8d7909308ec03a596928a394bb25ed9239f1/baked.jpg",
    );
    bakedTexture.flipY = false;
    bakedTexture.encoding = THREE.sRGBEncoding;

    const bakedMaterial = new THREE.MeshBasicMaterial({
      map: bakedTexture,
      side: THREE.DoubleSide,
    });

    // Loader
    const loader = new THREE.GLTFLoader();

    // Mouse tracking variables
    let mouseX = 0;
    let mouseY = 0;
    let targetX = 0;
    let targetY = 0;
    const windowHalfX = window.innerWidth / 2;
    const windowHalfY = window.innerHeight / 2;

    const handleMouseMove = (event: MouseEvent) => {
      // Create a smooth, subtle parallax offset
      // Multiplier controls how far it can move from center
      mouseX = (event.clientX - windowHalfX) * 0.005;
      mouseY = (event.clientY - windowHalfY) * 0.005;
    };

    window.addEventListener("mousemove", handleMouseMove);

    loader.load(
      "https://rawcdn.githack.com/ricardoolivaalonso/ThreeJS-Room01/98fd8d7909308ec03a596928a394bb25ed9239f1/THREEJS2.glb",
      (gltf: any) => {
        const model = gltf.scene;
        model.traverse((child: any) => {
          child.material = bakedMaterial;
        });
        scene.position.set(0, -2, 0);
        scene.add(model);
      },
      undefined,
      (error: any) => {
        console.error("Error loading model", error);
      },
    );

    const handleResize = () => {
      if (!mountNode) return;
      const newWidth = mountNode.clientWidth;
      const newHeight = mountNode.clientHeight;
      camera.aspect = newWidth / newHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(newWidth, newHeight);
      renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    };

    window.addEventListener("resize", handleResize);

    let animationId: number;
    const tick = () => {
      // Smoothly interpolate towards target
      targetX = mouseX;
      targetY = mouseY;

      // Update camera position with easing
      // It starts at x=18, y=10
      camera.position.x += (mouseX - (camera.position.x - 18)) * 0.05;
      camera.position.y += (-mouseY - (camera.position.y - 10)) * 0.05;

      controls.update();
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
    <Box
      ref={mountRef}
      w="100%"
      h="100%"
      position="absolute"
      top={0}
      left={0}
    />
  );
};

export default WorkspaceDiorama;
