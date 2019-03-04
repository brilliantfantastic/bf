import React from "react"
import { StaticQuery, graphql } from "gatsby"

import Header from "../components/Header"
import Layout from "../components/Layout"
import SEO from "../components/SEO"

const WorkPage = () => (
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
      <Layout>
        <SEO title="Work" keywords={[``]} />
        <Header
          foreColor={props => props.theme.colors.bfPink}
          siteTitle={data.site.siteMetadata.title}
        />
      </Layout>
    )}
  />
)

export default WorkPage
