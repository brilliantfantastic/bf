import styled from "styled-components"

const H1 = styled.h1`
  font-family: ${props => props.theme.fonts.heading};
  font-size: 2.5rem;
  font-weight: 700;
  margin: 0;

  ${props => props.theme.mq.tablet} {
    font-size: 3.5rem;
  }

  ${props => props.theme.mq.desktop} {
    font-size: 4.5rem;
  }
`;

export default H1;
