import React from "react"
import { StaticQuery, graphql } from "gatsby"

import Header from "../components/Header"
import Layout from "../components/Layout"
import SEO from "../components/SEO"

const AboutPage = () => (
  <StaticQuery
    query={graphql`
      query {
        site {
          siteMetadata {
            title
          }
        }
      }
    `}
    render={data => (
      <Layout backgroundColor={props => props.theme.colors.bfGreen}>
        <SEO title="About" keywords={[``]} />
        <Header
          foreColor={props => props.theme.colors.bfGreen}
          siteTitle={data.site.siteMetadata.title}
        />
      </Layout>
    )}
  />
)

export default AboutPage
