import {Alert, Box, Button, Container, Link, TextField, Typography} from "@mui/material";
import {useNavigate} from "react-router-dom";
import {useState} from "react";

export default function Register({onRegister}) {

  const navigate = useNavigate();

  const [error, setError] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [rePassword, setRePassword] = useState("");

  const onSubmit = async (event) => {
    event.preventDefault();

    if (password !== rePassword) return;

    setError("");
    const userData = {
      email,
      password
    }
    onRegister(userData)
    navigate('/login')
  }

  return (
    <Container maxWidth="xs" sx={{mt: 2}}>
      <Typography variant="h5" component="h1" gutterBottom textAlign="center">
        Crear cuenta
      </Typography>
      {error ? <Alert severity="error" sx={{my: 2}}>{error}</Alert> : <></>}
      <Box component="form" onSubmit={onSubmit}>
        <TextField
          label="Email"
          variant="outlined"
          autoComplete="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          sx={{mt: 3}}
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
        <TextField
          label="Confirm password"
          variant="outlined"
          type="password"
          autoComplete="new-password"
          value={rePassword}
          onChange={(e) => setRePassword(e.target.value)}
          sx={{mt: 3}}
          fullWidth
          required
        />
        <Button variant="contained" type="submit" sx={{mt: 3}} fullWidth>Sign up</Button>
        <Box sx={{mt: 2}}>
          Do you have an account already? <Link href="/login">Log in</Link>
        </Box>
      </Box>
    </Container>
  )
}