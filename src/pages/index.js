import React from "react"
import { StaticQuery, graphql } from "gatsby"

import Header from "../components/Header"
import HeroSection from "../components/HeroSection"
import Layout from "../components/Layout"
import MySection from "../components/MySection"
import SEO from "../components/SEO"

const IndexPage = () => (
  <StaticQuery
    query={graphql`
      query SiteDescriptionQuery {
        site {
          siteMetadata {
            description
            title
          }
        }
      }
    `}
    render={() => (
      <Layout backgroundColor={props => props.theme.colors.white}>
        <SEO title="Home" keywords={[`software company`]} />
        <Header displayTitle={false} foreColor={props => props.theme.colors.bfPink} />
        <HeroSection />
      </Layout>
    )}
  />
)

export default IndexPage
