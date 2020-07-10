import React from "react"
import { StaticQuery, graphql } from "gatsby"
import styled from 'styled-components'

import ContentWrapper from "../components/ContentWrapper"
import Header from "../components/Header"
import HeroImage from "../components/HeroImage"
import H1 from "../components/H1"
import Layout from "../components/Layout"
import Link from "../components/Link"
import SEO from "../components/SEO"

const HeroWrapper = styled(ContentWrapper)`
  width: 60%;
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
            title
          }
        }
      }
    `}
    render={data => (
      <Layout backgroundColor={props => props.theme.colors.bfPink}>
        <SEO title="Home" keywords={[`software company`]} />
        <Header displayTitle={false} foreColor={props => props.theme.colors.bfPink} />
        <HeroWrapper>
          <MainH1>brilliant fantastic</MainH1>
          <MainH2>
            A software company of one.
          </MainH2>
        </HeroWrapper>
        <HeroImage />
      </Layout>
    )}
  />
)

export default IndexPage
