import React from "react"
import { StaticQuery, graphql } from "gatsby"

import HeroImage from "../components/HeroImage"
import H1 from "../components/H1"
import Layout from "../components/Layout"
import SEO from "../components/SEO"

const IndexPage = () => (
  <StaticQuery
    query={graphql`
      query SiteDescriptionQuery {
        site {
          siteMetadata {
            description
          }
        }
      }
    `}
    render={data => (
      <Layout>
        <SEO title="Home" keywords={[`software company`]} />
        <H1>
          {data.site.siteMetadata.description}
        </H1>
        <HeroImage />
      </Layout>
    )}
  />
)

export default IndexPage
