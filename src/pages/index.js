import React from "react"
import { StaticQuery, graphql } from "gatsby"
import styled from 'styled-components'

import HeroImage from "../components/HeroImage"
import H1 from "../components/H1"
import Layout from "../components/Layout"
import SEO from "../components/SEO"

const Headings = styled.div`
  padding: 3em 2em 0.5em;
  width: 60%;

  ${props => props.theme.mq.mobile} {
    padding-left: 0.5em;
  }

  ${props => props.theme.mq.tablet} {
    padding-left: 1em;
  }

  ${props => props.theme.mq.desktop} {
    padding-left: 2em;
  }

  ${props => props.theme.mq.xl} {
    padding-left: 3em;
  }
`

const MainH1 = styled(H1)`
  line-height: 1.2;
`

const MainH2 = styled.h2`
  font-family: ${props => props.theme.fonts.body};
  line-height: 1.4;
  margin-top: 3em;
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
        <Headings>
          <MainH1>
            {data.site.siteMetadata.description}
          </MainH1>
          <MainH2>
            Hi, I'm Jamie, the person behind the robot you see down there. I create software. Some of it for specific customers. Some of it for anyone who is interested.
          </MainH2>
        </Headings>
        <HeroImage />
      </Layout>
    )}
  />
)

export default IndexPage
