import { Box, Button, Container, TextField, Typography } from "@mui/material";
import {
  Form,
  Link as RouterLink,
} from "react-router-dom";
import HeaderUser from "../components/HeaderUser/HeaderUser";
import "./Login.css"; 

export default function Login() {
  const signUpButtonStyle = {
    backgroundColor: "transparent",
    color: "rgb(81, 167, 144)",
    border: "none",
    borderRadius: "8px",
    padding: "8px",
    fontSize: "14px",
    textTransform: "uppercase",
    cursor: "pointer",
  };

  const inputStyle = {
    marginTop: "1rem", // Ajusta el margen superior de los campos de entrada
    width: "100%",
  };

  return (
    <Container maxWidth="xs"  className="Container">
      <HeaderUser />
      <Typography variant="h5" component="h1" gutterBottom className="Typography">
        Iniciar sesión
      </Typography>
      <Form method="post" replace className="Form">
        <TextField
          label="Email"
          variant="outlined"
          autoComplete="email"
          name="email"
          style={inputStyle}
          fullWidth
          required
        />
        <TextField
          label="Contraseña"
          variant="outlined"
          type="password"
          autoComplete="new-password"
          name="password"
          style={inputStyle}
          fullWidth
          required
        />
        <Button variant="contained" type="submit" className="Button">
          Login
        </Button>
      </Form>
      <Box className="SignUpText">
        ¿Todavía no tienes una cuenta?{" "}
        <Button 
          style={signUpButtonStyle}
          component={RouterLink} 
          to="/register" 
          >
          Regístrate
        </Button>
      </Box>
    </Container>
  );
}
