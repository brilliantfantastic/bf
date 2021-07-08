import React from "react"
import PropTypes from "prop-types"
import styled, { ThemeProvider } from 'styled-components'

import Footer from "../../components/Footer";
import GlobalStyles from "../../layout/GlobalStyles"
import theme from "../../layout/theme"

const PageWrapper = styled.main`
  background-color: ${props => props.backgroundColor};
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  z-index: -1;

`

const Layout = ({ backgroundColor, children }) => (
  <ThemeProvider theme={theme}>
    <React.Fragment>
      <GlobalStyles />
      <PageWrapper backgroundColor={backgroundColor}>
        {children}
        <Footer />
      </PageWrapper>
    </React.Fragment>
  </ThemeProvider>
)

Layout.propTypes = {
  children: PropTypes.node.isRequired,
}

export default Layout
