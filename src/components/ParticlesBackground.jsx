import { useEffect } from "react";
import { tsParticles } from "@tsparticles/engine";
import { loadSlim } from "@tsparticles/slim";

function ParticlesBackground() {
  useEffect(() => {
    let container;

    const init = async () => {
      await loadSlim(tsParticles);

      container = await tsParticles.load({
        id: "particles",
        options: {
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
      if (container) {
        container.destroy();
      }
    };
  }, []);

  return <div id="particles" className="fixed inset-0 -z-10" />;
}

export default ParticlesBackground;
