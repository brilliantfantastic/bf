import styled from "styled-components"

const H2 = styled.h2`
  font-family: ${props => props.theme.fonts.heading};
  font-size: 1.5rem;
  font-weight: 700;
  margin: 0;

  ${props => props.theme.mq.tablet} {
    font-size: 2rem;
  }

  ${props => props.theme.mq.desktop} {
    font-size: 2.5rem;
  }
`;

export default H2;
