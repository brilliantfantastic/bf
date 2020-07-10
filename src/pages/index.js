import React from "react"
import { StaticQuery, graphql } from "gatsby"
import styled from "styled-components"
import tw  from "twin.macro"

import ContentWrapper from "../components/ContentWrapper"
import Header from "../components/Header"
import HeroImage from "../components/HeroImage"
import H1 from "../components/H1"
import Layout from "../components/Layout"
import MySection from "../components/MySection"
import SEO from "../components/SEO"

const HeroSection = styled.main`
  ${tw`
    mt-8 mx-auto max-w-screen-xl px-4 sm:mt-12 sm:px-6 md:mt-20 xl:mt-24
  `}
`;

const ComingSoonDiv = styled.div`
  ${tw`
    text-sm font-semibold uppercase tracking-wide text-gray-500 sm:text-base lg:text-sm xl:text-base
  `}
`;

const HeroWrapper = styled(ContentWrapper)`
  width: 60%;
`

const MainH1 = styled(H1)`
  line-height: 1.2;
`

const MainH2 = styled.h2`
  font-family: ${props => props.theme.fonts.body};
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
    render={() => (
      <Layout backgroundColor={props => props.theme.colors.white}>
        <SEO title="Home" keywords={[`software company`]} />
        <Header displayTitle={false} foreColor={props => props.theme.colors.bfPink} />
        <HeroSection>
          <div class="lg:grid lg:grid-cols-12 lg:gap-8">
            <div class="sm:text-center md:max-w-2xl md:mx-auto lg:col-span-6 lg:text-left">
              <ComingSoonDiv>
                Coming soon
              </ComingSoonDiv>
            </div>
          </div>
        </HeroSection>
        {/*
        <HeroWrapper>
          <MainH1>brilliant fantastic</MainH1>
          <MainH2>
            A software company of one.
          </MainH2>
        </HeroWrapper>
        */}
      </Layout>
    )}
  />
)

export default IndexPage
