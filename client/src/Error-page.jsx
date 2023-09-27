import {Container, Typography} from "@mui/material";

export default function ErrorPage() {

  return (
    <Container maxWidth="xs" sx={{mt: 2}}>
      <Typography variant="h5" component="h1" gutterBottom>
        Oops!
      </Typography>
      <Typography variant="p" component="p" gutterBottom>
        Sorry, an unexpected error has occurred.
      </Typography>
    </Container>
  );
}