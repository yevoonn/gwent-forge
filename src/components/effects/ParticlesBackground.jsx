import { useEffect } from "react";
import { tsParticles } from "@tsparticles/engine";
import { loadFirePreset } from "@tsparticles/preset-fire";

function ParticlesBackground() {
  useEffect(() => {
    let container;
    let cancelled = false;

    const init = async () => {
      await loadFirePreset(tsParticles);

      if (cancelled) return;

      container = await tsParticles.load({
        id: "particles",
        options: {
          preset: "fire",
          fpsLimit: 60,
          fullScreen: {
            enable: false,
          },
          particles: {
            number: {
              value: 50,
              density: { enable: true },
            },
            color: {
              value: ["#f5d06f", "#c89b3c", "#ffeb99"],
            },
            shape: { type: "circle" },
            opacity: {
              value: { min: 0.1, max: 0.6 },
              animation: {
                enable: true,
                speed: 0.5,
              },
            },
            size: {
              value: { min: 1, max: 4 },
            },
            move: {
              enable: true,
              speed: 0.3,
              direction: "none",
              random: true,
              outModes: { default: "out" },
            },
            links: { enable: false },
          },
        },
      });
    };

    init();

    return () => {
      cancelled = true;

      if (container) {
        container.destroy();
      }
    };
  }, []);

  return <div id="particles" className="fixed inset-0 -z-10" />;
}

export default ParticlesBackground;
