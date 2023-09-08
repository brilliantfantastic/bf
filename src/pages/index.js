import React from "react"
import { StaticQuery, graphql } from "gatsby"

import HeroSection from "../components/HeroSection"
import Layout from "../components/Layout"
import MySection from "../components/MySection"
import NavBar from "../components/NavBar"
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
        <NavBar backgroundColor="bf-pink" displayLogo={true} displayTitle={false} />
        <HeroSection />
        <MySection />
      </Layout>
    )}
  />
)

export default IndexPage
