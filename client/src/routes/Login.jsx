import { Box, Button, Container, TextField, Typography } from "@mui/material";
import {
  Form,
  Link as RouterLink,
} from "react-router-dom";
import Header from "../components/Header/Header";

export default function Login() {

  return (
    <Container maxWidth="xs" sx={{ mt: 2 }}>
      <Header />
      <Typography variant="h5" component="h1" gutterBottom textAlign="center">
        Iniciar sesión
      </Typography>
      <Form method="post" replace>
        <TextField
          label="Email"
          variant="outlined"
          autoComplete="email"
          name="email"
          sx={{ mt: 1 }}
          fullWidth
          required
        />
        <TextField
          label="Password"
          variant="outlined"
          type="password"
          autoComplete="new-password"
          name="password"
          sx={{ mt: 3 }}
          fullWidth
          required
        />
        <Button variant="contained" type="submit" sx={{ mt: 3 }} fullWidth>
          Login
        </Button>
      </Form>
      <Box sx={{ mt: 2 }}>
        Don&apos;t have an account yet?{" "}
        <Button component={RouterLink} to="register">
          Sign up
        </Button>
      </Box>
    </Container>
  );
}
