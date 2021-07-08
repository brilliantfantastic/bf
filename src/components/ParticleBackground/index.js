import React from "react"

import Particles from "react-particles-js"

const ParticleBackground = () => (
  <Particles
    className={`absolute w-full h-full`}
    params={{
      particles: {
        number: {
          value: 80,
          density: {
            enable: true,
            value_area: 800
          }
        },
        color: {
          value: "#fff"
        },
        size: {
          value: 3,
          random: true,
          anim: {
            speed: 4,
            size_min: 0.3
          }
        },
        shape: {
          type: "circle",
        },
        line_linked: {
          enable: false
        },
        move: {
          direction: "none",
          out_mode: "out",
          random: true,
          speed: 1,
        }
      },
      interactivity: {
        events: {
          onhover: {
            enable: true,
            mode: "bubble"
          },
          onclick: {
            enable: true,
            mode: "repulse"
          }
        },
        modes: {
          bubble: {
            distance: 250,
            duration: 2,
            size: 0,
            opacity: 0
          },
          repulse: {
            distance: 400,
            duration: 4
          }
        }
      }
    }}
  />
)

export default ParticleBackground
