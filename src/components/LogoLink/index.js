import React from "react"
import { StaticQuery, graphql } from "gatsby"
import styled from "styled-components"
import { Link } from "gatsby"
import Img from "gatsby-image"

const StyledLink = styled(Link)`
  color: ${prop => prop.theme.colors.foreground};
  font-family: ${props => props.theme.fonts.heading};
  font-size: 2rem;
  line-height: 1.2;
  text-decoration: none;
`

const LogoLink = ({ displayLogo, siteTitle }) => (
  <StaticQuery
    query={graphql`
      query LogoLinkImageQuery {
        file(relativePath: { eq: "brillfan.png" }) {
          childImageSharp {
            fixed(height: 32) {
              ...GatsbyImageSharpFixed
            }
          }
        }
      }
    `}
    render={data => (
      <React.Fragment>
        <StyledLink to="/">
          {displayLogo &&
            <Img
              fixed={data.file.childImageSharp.fixed}
              alt="Latest Work"
              style={{ display: `inline-block`, marginRight: `4px` }}
            />
          }
          {siteTitle}
        </StyledLink>
      </React.Fragment>
    )}
  />
)

export default LogoLink
