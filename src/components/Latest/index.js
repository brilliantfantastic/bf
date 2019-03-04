import React from "react"
import styled from 'styled-components'
import Img from "gatsby-image"
import { StaticQuery, graphql } from "gatsby"

const H3 = styled.h3`
  font-family: ${props => props.theme.fonts.heading};
  font-size: 3rem;
  font-weight: 400;
  margin: 0 auto;
  text-align: center;
  width: 100%;
`

const LatestWrapper = styled.div`
  display: flex;
  padding: 2em 1em;
`

const Latest = () => (
  <StaticQuery
    query={graphql`
      query LatestHeaderImageQuery {
        file(relativePath: { eq: "latest.png" }) {
          childImageSharp {
            fixed(width: 100) {
              ...GatsbyImageSharpFixed
            }
          }
        }
      }
    `}
    render={data => (
      <LatestWrapper>
        <H3>
          <Img
            fixed={data.file.childImageSharp.fixed}
            alt="Latest Work"
            style={{ display: `inherit`, margin: `0 auto` }}
          />
          The Latest
        </H3>
      </LatestWrapper>
    )}
  />
)

export default Latest
