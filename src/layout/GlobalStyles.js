import { createGlobalStyle } from "styled-components"

import theme from "../layout/theme"

const GlobalStyles = createGlobalStyle`
  body {
    background: ${theme.colors.backgroundPink};
  }
`;

export default GlobalStyles
