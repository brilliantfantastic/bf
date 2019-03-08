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
        <Header
          displayLogo={false}
          foreColor={props => props.theme.colors.bfPink}
          siteTitle={data.site.siteMetadata.title}
        />
        <HeroWrapper>
          <MainH1>bf 2.oh?</MainH1>
          <MainH2>
            Technically, it's my third round, but no one's counting
            except me. I am building a more genuine and transparent
            company. And I am more driven than ever.
            <p>
            More to come, but for now, you just have my <Link fancy to="/blog">writing</Link>.
            </p>
          </MainH2>
          {/*
          <MainH1>
            {data.site.siteMetadata.description}
          </MainH1>
          <MainH2>
            Hi, I'm Jamie, the person behind the robot you see down there. I create software. Some of it for specific customers. Some of it for anyone who is interested.
          </MainH2>
          <Latest />
          */}
        </HeroWrapper>
        <HeroImage />
      </Layout>
    )}
  />
)

export default IndexPage
