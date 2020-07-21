import React from "react"

import heroImage from "../../images/clay.png"
import theme from "../../layout/theme"

import H1 from "../H1"

const HeroSection = () => (
  <div className="relative h-screen" style={{ backgroundColor: `${theme.colors.bfPink}` }}>
    <div className="mt-8 mx-auto max-w-screen-xl px-4 sm:mt-12 sm:px-6 md:mt-20 xl:mt-24 ">
      <div className="lg:grid lg:grid-cols-12 lg:gap-8">
        <div className="sm:text-center md:max-w-2xl md:mx-auto lg:col-span-6 lg:text-left">
          <H1 className="leading-tight">brilliant fantastic</H1>
          <h2>A software company of one.</h2>
        </div>
      </div>
    </div>
    <div className="relative w-full h-64 sm:h-72 md:h-96 lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2 lg:h-full">
      <img className="absolute inset-0 w-full h-full object-cover" src={heroImage} alt="claymation brill fan" />
    </div>
  </div>
)

export default HeroSection
