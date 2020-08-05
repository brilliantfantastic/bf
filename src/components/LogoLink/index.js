import React from "react"
import { StaticQuery, graphql } from "gatsby"
import { Link } from "gatsby"
import Img from "gatsby-image"

const LogoLink = ({ displayLogo = true, displayTitle = true, siteTitle }) => (
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
        <Link
          to="/"
          className={`text-black
                      font-heading
                      text-3xl
                      no-underline
                      leading-tight
                      ${(displayLogo || displayTitle) ? "inline-block" : "hidden"}`}
        >
          <Img
            fixed={data.file.childImageSharp.fixed}
            alt="Brilliant Fantastic logo"
            className={`mr-2 ${displayLogo ? "inline-block" : "hidden"}`}
          />
          {displayTitle && siteTitle}
        </Link>
      </React.Fragment>
    )}
  />
)

export default LogoLink
