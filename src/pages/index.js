import React from "react"
import { StaticQuery, graphql } from "gatsby"
import styled from 'styled-components'

import HeroImage from "../components/HeroImage"
import H1 from "../components/H1"
import Layout from "../components/Layout"
import SEO from "../components/SEO"

const MainH1 = styled(H1)`
  line-height: 1.2;
  margin: 2em 2em 0.5em;
  width: 50%;

  ${props => props.theme.mq.mobile} {
    margin-left: 0.5em;
  }

  ${props => props.theme.mq.tablet} {
    margin-left: 1em;
  }

  ${props => props.theme.mq.desktop} {
    margin-left: 2em;
  }

  ${props => props.theme.mq.xl} {
    margin-left: 3em;
  }
`

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
        <MainH1>
          {data.site.siteMetadata.description}
        </MainH1>
        <HeroImage />
      </Layout>
    )}
  />
)

export default IndexPage
