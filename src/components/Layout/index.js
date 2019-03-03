import React from "react"
import PropTypes from "prop-types"
import styled, { ThemeProvider } from 'styled-components'

import Footer from "../../components/Footer";
import GlobalStyles from "../../layout/GlobalStyles"
import theme from "../../layout/theme"

const Content = styled.div`
  flex: 1 0 auto;
`

const PageWrapper = styled.div`
  display: flex;
  flex-direction: column;
  min-height: 100vh;

`

const Layout = ({ children }) => (
  <ThemeProvider theme={theme}>
    <React.Fragment>
      <GlobalStyles />
      <PageWrapper>
        <Content>
          {children}
        </Content>
        <Footer />
      </PageWrapper>
    </React.Fragment>
  </ThemeProvider>
)

Layout.propTypes = {
  children: PropTypes.node.isRequired,
}

export default Layout
