import React from "react"
import styled from 'styled-components'
import Img from "gatsby-image"
import { Link, StaticQuery, graphql } from "gatsby"
import { rgba } from "polished";

const H3 = styled.h3`
  font-family: ${props => props.theme.fonts.heading};
  font-size: 3rem;
  font-weight: 700;
  margin: 0 auto;
  text-align: center;
  width: 100%;
`

const LatestWrapper = styled.div`
  padding: 3em 1em 2em;
`

const BlogPostWrapper = styled.div`
  padding: 2em 0;
  width: 100%;
`

const BlogPost = styled.div`
  a {
    color: ${props => props.theme.colors.bfGreen};
    text-decoration: none;

    &:hover {
      text-decoration: underline;
    }
  }
`

const BlogPostAuthor = styled.div`
  padding-right: 1rem;
`

const BlogPostDate = styled.div`
  padding-right: 1rem;
`

const BlogPostExcerpt = styled.div`
  color: ${props => rgba(props.theme.colors.foreground, 0.6)};
`

const BlogPostMetaData = styled.div`
  color: ${props => rgba(props.theme.colors.foreground, 0.4)};
  display: flex;
  padding-bottom: 0.5rem;
`

const BlogPostTitle = styled.div`
  font-family: ${props => props.theme.fonts.heading};
  font-size: 2rem;

  a {
    color: ${props => props.theme.colors.foreground};
    text-decoration: none;

    &:hover {
      text-decoration: none;
    }
  }
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
        <BlogPostWrapper>
          <BlogPost>
            <BlogPostMetaData>
              <BlogPostDate>Nov 1, 2017</BlogPostDate>
              <BlogPostAuthor>Jamie Wright</BlogPostAuthor>
            </BlogPostMetaData>
            <BlogPostTitle><Link>November Hacking</Link></BlogPostTitle>
            <BlogPostExcerpt>
              <p>
                A few things came together for me over the last several weeks.
              </p>
              <p>
                The first thing was that Product Hunt announced their hackathon for the month of November.
              </p>
              <p>
                Secondly, I have been wanting to build a pomodoro app with very specific features for about five years now. I use the Pomodoro Technique everyday and it is vital in my productivity. It has helped me fight back my diagnosed ADD over the years.
              </p>
            </BlogPostExcerpt>
            <Link>Read more &#8594;</Link>
          </BlogPost>
        </BlogPostWrapper>
      </LatestWrapper>
    )}
  />
)

export default Latest
