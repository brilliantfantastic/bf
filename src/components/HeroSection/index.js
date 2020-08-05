import React from "react"
import { StaticQuery, graphql } from "gatsby"
import Img from "gatsby-image"

import H1 from "../H1"

const HeroSection = () => (
  <StaticQuery
    query={graphql`
      query HeroSectionImageQuery {
        file(relativePath: { eq: "clay.png" }) {
          childImageSharp {
            fluid(maxHeight: 700, quality: 100, traceSVG: { background: "#ef73a5",
                                                            color: "#e83862" }) {
              ...GatsbyImageSharpFluid_tracedSVG
            }
          }
        }
      }
    `}
    render={data => (
      <div className="relative h-screen bg-bf-pink">
        <div className="mt-8 mx-auto max-w-screen-xl px-4 sm:mt-12 sm:px-6 md:mt-20 xl:mt-24 ">
          <div className="lg:grid lg:grid-cols-12 lg:gap-8">
            <div className="text-center md:max-w-2xl md:mx-auto lg:col-span-6 lg:text-left">
              <H1 className="leading-tight xl:text-10xl lg:text-9xl">
                brilliant fantastic
              </H1>
              <h2>A software company of one.</h2>
            </div>
          </div>
        </div>
        <div className="relative w-full mt-8 sm:h-72 md:h-96 lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2 lg:mt-16">
          <Img
            fluid={data.file.childImageSharp.fluid}
            alt="Claymation Brill Fan"
            style={{ display: `inherit` }}
          />
        </div>
      </div>
    )}
  />
)

export default HeroSection
