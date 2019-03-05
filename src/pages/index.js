import React from "react"
import { StaticQuery, graphql } from "gatsby"
import styled from 'styled-components'

import Header from "../components/Header"
import HeroImage from "../components/HeroImage"
import H1 from "../components/H1"
import Layout from "../components/Layout"
import Latest from "../components/Latest"
import SEO from "../components/SEO"

const HeroWrapper = styled.div`
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
            title
          }
        }
      }
    `}
    render={data => (
      <Layout backgroundColor={props => props.theme.colors.bfPink}>
        <SEO title="Home" keywords={[`software company`]} />
        <Header
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
            More to come, but for now, you just have my writing.
            </p>
            <p>
              <a href="mailto:hi@brilliantfantastic.com">
                Send email correspondence
              </a>
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
