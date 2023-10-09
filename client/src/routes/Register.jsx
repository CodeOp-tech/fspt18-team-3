import { Box, Button, Container, TextField, Typography } from "@mui/material";
import {
  Form,
  Link
} from "react-router-dom";
import { styled } from "@mui/material/styles";
import { useState } from "react";
import MuiInput from "@mui/material/Input";
import HeaderUser from "../components/HeaderUser/HeaderUser";
import "./Register.css";

const Input = styled(MuiInput)`
  width: 42px;
`;

export default function Register() {

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [rePassword, setRePassword] = useState("");
  const [weeks, setWeeks] = useState(0);
  const [username, setUsername] = useState("");
  const [babyName, setBabyName] = useState("");

  const handleInputChange = (event) => {
    setWeeks(event.target.value === "" ? 0 : Number(event.target.value));
  };

  const handleBlur = () => {
    if (weeks < 0) {
      setWeeks(0);
    } else if (weeks > 42) {
      setWeeks(42);
    }
  };

  return (
    <Container maxWidth="xs" className="Container">
      <HeaderUser />
      <Typography variant="h5" component="h1" gutterBottom className="Typography">
        Crear cuenta
      </Typography>
      <Form method="post" replace className="Form">
        <TextField
          label="Nombre de usuario"
          variant="outlined"
          name="username"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          sx={{ mt: 3 }}
          fullWidth
          required
        />
        <TextField
          label="Email"
          variant="outlined"
          name="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          sx={{ mt: 3 }}
          fullWidth
          required
        />
        <TextField
          label="Contraseña"
          variant="outlined"
          type="password"
          name="password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          sx={{ mt: 3 }}
          fullWidth
          required
        />
        <TextField
          label="Confirma tu contraseña"
          variant="outlined"
          type="password"
          name="rePassword"
          value={rePassword}
          onChange={(e) => setRePassword(e.target.value)}
          sx={{ mt: 3 }}
          fullWidth
          required
        />
        <TextField
          label="Nombre de tu bebé"
          variant="outlined"
          name="babyName"
          value={babyName}
          onChange={(e) => setBabyName(e.target.value)}
          sx={{ mt: 3 }}
          fullWidth
        />
        <Box
          sx={{
            display: "flex",
            justifyContent: "space-evenly",
            margin: "20px 0 0 0",
          }}
        >
          <Typography id="input-number">
            ¿De cuántas semanas estás embarazada?
          </Typography>
          <Input
            value={weeks}
            size="medium"
            name="weeksPregnant"
            onChange={handleInputChange}
            onBlur={handleBlur}
            inputProps={{
              step: 1,
              min: 0,
              max: 42,
              type: "number",
              "aria-labelledby": "input-number",
            }}
          />
        </Box>
        <Button variant="contained" type="submit" className="Button">
          Registrarme
        </Button>
      </Form>
      <Box className="DoYouHaveAccount">
        ¿Ya tienes una cuenta?{" "}
        <Link to="login" className="Link">
          Inicia sesión
        </Link>
      </Box>
    </Container>
  );
}
