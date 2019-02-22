import { createGlobalStyle } from "styled-components"

import theme from "../layout/theme"

const GlobalStyles = createGlobalStyle`
  html, body {
    height: 100%;
  }

  body {
    background: ${theme.colors.backgroundPink};
    margin: 0;
  }
`;

export default GlobalStyles
