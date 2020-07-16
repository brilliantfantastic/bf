import React from "react"

import H1 from "../H1"

const HeroSection = () => (
  <main className="mt-8 mx-auto max-w-screen-xl px-4 sm:mt-12 sm:px-6 md:mt-20 xl:mt-24 bg-gray-400">
    <div className="lg:grid lg:grid-cols-12 lg:gap-8">
      <div className="sm:text-center md:max-w-2xl md:mx-auto lg:col-span-6 lg:text-left">
        <H1 className="leading-tight">brilliant fantastic</H1>
        <h2>A software company of one.</h2>
      </div>
    </div>
  </main>
)

export default HeroSection
