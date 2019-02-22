import React from "react";
import { StaticQuery, graphql } from "gatsby"
import Img from "gatsby-image"
import styled from "styled-components"

const ImageWrapper = styled.div`
  bottom: -24px;
  position: fixed;
  right: 24px;
  width: ${props => `${Math.trunc(12 * props.theme.base / 1.62)}px`};

  ${props => props.theme.mq.mobile} {
    width: ${props => `${Math.trunc(19 * props.theme.base / 1.62)}px`};
  }

  ${props => props.theme.mq.phablet} {
    bottom: -36px;
    width: ${props => `${Math.trunc(25 * props.theme.base / 1.62)}px`};
  }

  ${props => props.theme.mq.tablet} {
    bottom: -48px;
    right: 48px;
    width: ${props => `${Math.trunc(31 * props.theme.base / 1.62)}px`};
  }

  ${props => props.theme.mq.desktop} {
    right: 48px;
    width: ${props => `${Math.trunc(37 * props.theme.base / 1.62)}px`};
  }

  ${props => props.theme.mq.xl} {
    right: 96px;
    width: ${props => `${Math.trunc(43 * props.theme.base / 1.62)}px`};
  }

  ${props => props.theme.mq.xxl} {
    right: 192px;
    width: ${props => `${Math.trunc(50 * props.theme.base / 1.62)}px`};
  }
`;

const HeroImage = () => (
  <StaticQuery
    query={graphql`
      query HeroImageQuery {
        file(relativePath: { eq: "brillfan.png" }) {
          childImageSharp {
            fluid(maxHeight: 800, quality: 100, traceSVG: { background: "#ef73a5",
                                                            color: "#e83862" }) {
              ...GatsbyImageSharpFluid_tracedSVG
            }
          }
        }
      }
    `}
    render={data => (
      <ImageWrapper>
        <Img
          fluid={data.file.childImageSharp.fluid}
          alt="Brilliant Fantastic"
          style={{ display: `inherit` }}
        />
      </ImageWrapper>
    )}
  />
)

export default HeroImage;
