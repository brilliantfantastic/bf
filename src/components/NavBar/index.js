import React from "react"
import { StaticQuery, graphql } from "gatsby"

import LogoLink from "../LogoLink"
import MenuLinkItem from "../MenuLinkItem"

const NavBar = ({ backgroundColor = "white",
                  displayLogo = true,
                  displayTitle = true }) => (
  <StaticQuery
    query={graphql`
      query {
        site {
          siteMetadata {
            title
          }
        }
      }
    `}
    render={data => (
      <nav class={`bg-${backgroundColor} shadow`}>
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="flex justify-between h-16">
            <div class="flex">
              <div class="flex-shrink-0 flex items-center">
                <LogoLink
                  displayLogo={displayLogo}
                  displayTitle={displayTitle}
                  siteTitle={data.site.siteMetadata.title}
                />
              </div>
              <div class="hidden sm:ml-6 sm:flex">
                <MenuLinkItem href="/work" text="Work" />
                <MenuLinkItem
                  href="/blog"
                  text="Blog"
                  className="ml-8"
                />
                <MenuLinkItem
                  href="mailto:hi@brilliantfantastic.com"
                  text="Reach Out"
                  external={true}
                  className="ml-8"
                />
              </div>
            </div>
            <div class="-mr-2 flex items-center sm:hidden">
              <button class={`inline-flex
                              items-center
                              justify-center
                              p-4
                              rounded-md
                              text-black
                              focus:outline-none
                              transition
                              duration-150
                              ease-in-out`}
                      aria-label="Main menu"
                      aria-expanded="false"
              >
                <svg class="block h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M4 6h16M4 12h16M4 18h16" />
                </svg>
                <svg class="hidden h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>
          </div>
        </div>
      </nav>
    )}
  />
)

export default NavBar
