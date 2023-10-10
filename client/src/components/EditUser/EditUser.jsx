import { useState } from "react";
import { Form, Link as RouterLink } from "react-router-dom";
import {
  Button,
  Container,
  TextField,
  Typography,
  Input as MuiInput,
} from "@mui/material";
import { Box } from "@mui/material";
import { styled } from "@mui/material/styles";
import "./EditUser.css";
import { useLoaderData } from "react-router-dom";
import HeaderUser from "../HeaderUser/HeaderUser";

const Input = styled(MuiInput)`
  width: 42px;
`;

const EditUser = () => {
  const user = useLoaderData();

  const editButtonStyle = {
    backgroundColor: "transparent",
    color: "rgb(81, 167, 144)",
    border: "none",
    padding: "8px",
    fontSize: "14px",
    textTransform: "uppercase"
  };

  const [email, setEmail] = useState();
  const [password, setPassword] = useState();
  const [weeks, setWeeks] = useState();
  const [username, setUsername] = useState();
  const [babyName, setBabyName] = useState();

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
      <HeaderUser user={user} />
      <Typography variant="h5" className="Typography">
        Edita tus datos
      </Typography>
      <Form method="put" replace className="Form">
        <TextField
          label="Nombre de usuario"
          variant="outlined"
          name="username"
          defaultValue={username ?? user.user_name}
          onChange={(e) => setUsername(e.target.value)}
          sx={{ mt: 3 }}
          fullWidth
        />
        <TextField
          label="Email"
          variant="outlined"
          name="email"
          defaultValue={email ?? user.mail}
          onChange={(e) => setEmail(e.target.value)}
          sx={{ mt: 3 }}
          fullWidth
        />
        <TextField
          label="Contraseña"
          variant="outlined"
          type="password"
          name="password"
          defaultValue={password ?? user.user_password}
          onChange={(e) => setPassword(e.target.value)}
          sx={{ mt: 3 }}
          fullWidth
        />
        <TextField
          label="Nombre de tu bebé"
          variant="outlined"
          name="babyName"
          defaultValue={babyName ?? user.baby_name}
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
            defaultValue={weeks ?? user.weeks_pregnant}
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
        <Button style={editButtonStyle} component={RouterLink} to="/profile">
          Guardar
        </Button>
      </Form>
    </Container>
  );
};

export default EditUser;
