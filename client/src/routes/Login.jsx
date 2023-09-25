import {Alert, Box, Button, Container, Link, TextField, Typography} from "@mui/material";
import {useNavigate} from "react-router-dom";
import {useState} from "react";

export default function Login({onLogin}) {

  //const navigate = useNavigate();

  const [error, setError] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const onSubmit = async (event) => {
    event.preventDefault();

    // clear the errors
    setError("");

    const userData = {
      email,
      password
    }
    onLogin(userData)
  }

  return (
    <Container maxWidth="xs" sx={{mt: 2}}>
      <Typography variant="h5" component="h1" gutterBottom textAlign="center">
        Iniciar sesión
      </Typography>
      {error ? <Alert severity="error" sx={{my: 2}}>{error}</Alert> : <></>}
      <Box component="form" onSubmit={onSubmit}>
        <TextField
          label="Email"
          variant="outlined"
          autoComplete="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          sx={{mt: 1}}
          fullWidth
          required
        />
        <TextField
          label="Password"
          variant="outlined"
          type="password"
          autoComplete="new-password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          sx={{mt: 3}}
          fullWidth
          required
        />
        <Button variant="contained" type="submit" sx={{mt: 3}} fullWidth>Login</Button>
        <Box sx={{mt: 2}}>
          Don&apos;t have an account yet? <Link href="/register">Register</Link>
        </Box>
      </Box>
    </Container>
  )
}