import React from "react"

import HeroImage from "../components/HeroImage";
import Layout from "../components/Layout"
import SEO from "../components/SEO"

const IndexPage = () => (
  <Layout>
    <SEO title="Home" keywords={[`gatsby`, `application`, `react`]} />
    <HeroImage />
  </Layout>
)

export default IndexPage
