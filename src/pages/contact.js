import React from "react"
import { StaticQuery, graphql } from "gatsby"

import Header from "../components/Header"
import Layout from "../components/Layout"
import SEO from "../components/SEO"

const ContactPage = () => (
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
      <Layout backgroundColor={props => props.theme.colors.purple}>
        <SEO title="Work" keywords={[``]} />
        <Header
          displayLogo={true}
          foreColor={props => props.theme.colors.purple}
          siteTitle={data.site.siteMetadata.title}
        />
      </Layout>
    )}
  />
)

export default ContactPage
