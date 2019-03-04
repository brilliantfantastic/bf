import React from "react"
import styled from "styled-components"
import { Link } from "gatsby"

import BurgerMenu from "../BurgerTime"

const MenuContents = styled.ul`
  color: ${props => props.foreColor};
  display: flex;
  height: 100vh;
  flex-direction: column;
  list-style-type: none;
  margin: 0 auto;
  padding: 0;
  text-align: center;

  a {
    color: ${props => props.foreColor};
    text-decoration: none;
  }
`

const MenuHeading = styled.h3`
  font-family: ${props => props.theme.fonts.heading};
  font-size: 3rem;
  font-weight: 400;
  letter-spacing: 0.2em;
  line-height: 1.2;
  text-transform: uppercase;
`

const MenuHeader = ({ children }) => (
  <li>
    <MenuHeading>{children}</MenuHeading>
  </li>
)

const MenuItem = styled.li`
  font-size: 2rem;
  padding: 16px 0;
`

const MenuSection = styled.ul`
  list-style-type: none;
  margin: 0 auto;
  padding: 0;
  text-align: center;
`

const MenuWrapper = styled.div`
  align-self: flex-end;
`

const Menu = ({ foreColor }) => (
  <MenuWrapper>
    <BurgerMenu>
      <MenuContents foreColor={foreColor}>
        <MenuHeader><Link to={`/work`}>Work</Link></MenuHeader>
        <MenuSection>
          <MenuItem><Link to={`/work`}>Latest</Link></MenuItem>
          <MenuItem><Link to={`/work`}>Chronic</Link></MenuItem>
          <MenuItem><Link to={`/work`}>Tatsu</Link></MenuItem>
        </MenuSection>
        <MenuHeader><Link to={`/about`}>About</Link></MenuHeader>
        <MenuHeader><Link to={`/blog`}>Blog</Link></MenuHeader>
        <MenuHeader><Link to={`/contact`}>Reach Out</Link></MenuHeader>
      </MenuContents>
    </BurgerMenu>
  </MenuWrapper>
)

export default Menu
