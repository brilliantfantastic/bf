import { createGlobalStyle } from "styled-components"

import theme from "../layout/theme"
import "../fonts/fat-frank.css"
import "../fonts/lacrima-senza.css"
import "../fonts/omnes-pro.css"

const GlobalStyles = createGlobalStyle`
  html, body {
    height: 100%;
  }

  body {
    background: ${theme.colors.bfPink};
    font-family: ${theme.fonts.body};
    font-size: 16px;
    margin: 0;
  }
`;

export default GlobalStyles
