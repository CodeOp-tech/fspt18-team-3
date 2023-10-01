import { Box, Button, Container, TextField, Typography } from "@mui/material";
import {
  Form,
  Link
} from "react-router-dom";
import { styled } from "@mui/material/styles";
import { useState } from "react";
import MuiInput from "@mui/material/Input";
import Header from "../components/Header/Header";

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
    <Container maxWidth="xs" sx={{ mt: 2 }}>
      <Header />
      <Typography variant="h5" component="h1" gutterBottom textAlign="center">
        Crear cuenta
      </Typography>
      <Form method="post" replace>
        <TextField
          label="Username"
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
          label="Password"
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
          label="Confirm password"
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
          label="Baby name"
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
            How many weeks are you pregnant?
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
        <Button variant="contained" type="submit" sx={{ mt: 3 }} fullWidth>
          Sign up
        </Button>
      </Form>
      <Box sx={{ mt: 2 }}>
        Do you have an account already?{" "}
        <Link to="login">
          Log in
        </Link>
      </Box>
    </Container>
  );
}
