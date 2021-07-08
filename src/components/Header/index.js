import React from "react"
import styled from "styled-components"
import PropTypes from "prop-types"

import LogoLink from "../LogoLink"
import Menu from "../Menu"

const HeaderWrapper = styled.div`
  display: flex;
  justify-content: space-between;
  margin: 16px;
`

const Header = ({ displayLogo = true, displayTitle = true, foreColor, siteTitle }) => (
  <HeaderWrapper>
    <LogoLink display={displayTitle} displayLogo={displayLogo} siteTitle={siteTitle} />
    <Menu foreColor={foreColor} />
  </HeaderWrapper>
)

Header.propTypes = {
  siteTitle: PropTypes.string,
}

Header.defaultProps = {
  siteTitle: ``,
}

export default Header
